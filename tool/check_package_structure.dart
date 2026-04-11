import 'dart:collection';
import 'dart:io';

void main(List<String> args) async {
  final options = _parseArgs(args);
  if (options.showHelp) {
    _printUsage();
    return;
  }

  final packageNames = _findPackageNames();
  if (packageNames.isEmpty) {
    stderr.writeln('No packages found under packages/.');
    exitCode = 1;
    return;
  }

  final dependencies = <String, Set<String>>{};
  for (final pkg in packageNames) {
    dependencies[pkg] = _parseLocalDependencies(pkg, packageNames);
  }

  final dependents = <String, Set<String>>{
    for (final pkg in packageNames) pkg: <String>{},
  };
  dependencies.forEach((pkg, deps) {
    for (final dep in deps) {
      dependents[dep]!.add(pkg);
    }
  });

  stdout.writeln('=== Package Structure Report ===');
  stdout.writeln('Packages: ${packageNames.length}');
  stdout.writeln('');

  final cycles = _findCycles(packageNames, dependencies);
  if (cycles.isEmpty) {
    stdout.writeln('Circular dependencies: none');
  } else {
    stdout.writeln('Circular dependencies: ${cycles.length}');
    for (final cycle in cycles) {
      stdout.writeln('  - ${cycle.join(' -> ')} -> ${cycle.first}');
    }
  }
  stdout.writeln('');

  final blastRadius = <String, int>{};
  for (final pkg in packageNames) {
    blastRadius[pkg] = _transitiveDependents(pkg, dependents).length;
  }

  final ranked = packageNames.toList()
    ..sort((a, b) {
      final cmp = blastRadius[b]!.compareTo(blastRadius[a]!);
      if (cmp != 0) {
        return cmp;
      }
      return a.compareTo(b);
    });

  stdout.writeln('Blast radius (how many packages are retested if this changes):');
  for (final pkg in ranked) {
    final radius = blastRadius[pkg]!;
    final marker = radius == 0 ? 'leaf' : 'hotspot';
    stdout.writeln('  - $pkg: $radius ($marker)');
  }
  stdout.writeln('');

  if (options.base != null) {
    final changed = await _directlyChangedPackages(options.base!, packageNames);
    if (changed.isEmpty) {
      stdout.writeln('No package changes detected vs ${options.base}.');
    } else {
      final affected = <String>{...changed};
      for (final pkg in changed) {
        affected.addAll(_transitiveDependents(pkg, dependents));
      }

      final affectedSorted = affected.toList()..sort();
      stdout.writeln('Changed packages vs ${options.base}: ${changed.join(', ')}');
      stdout.writeln('Affected packages to test: ${affectedSorted.join(', ')}');
      stdout.writeln('Affected count: ${affectedSorted.length}/${packageNames.length}');

      if (options.maxAffected != null && affectedSorted.length > options.maxAffected!) {
        stderr.writeln(
          'Affected package count ${affectedSorted.length} exceeds limit ${options.maxAffected}.',
        );
        exitCode = 1;
      }
    }
    stdout.writeln('');
  }

  if (options.maxBlastRadius != null) {
    final offenders = ranked
        .where((pkg) => blastRadius[pkg]! > options.maxBlastRadius!)
        .toList();
    if (offenders.isNotEmpty) {
      stderr.writeln(
        'Packages exceeding max blast radius ${options.maxBlastRadius}: ${offenders.join(', ')}',
      );
      exitCode = 1;
    }
  }

  if (cycles.isNotEmpty) {
    exitCode = 1;
  }
}

List<String> _findPackageNames() {
  final root = Directory('packages');
  if (!root.existsSync()) {
    return const [];
  }

  final names = root
      .listSync()
      .whereType<Directory>()
      .map((d) => d.uri.pathSegments[d.uri.pathSegments.length - 2])
      .where((name) => File('packages/$name/pubspec.yaml').existsSync())
      .toList()
    ..sort();
  return names;
}

Set<String> _parseLocalDependencies(String pkg, List<String> packageNames) {
  final localPackages = packageNames.toSet();
  final file = File('packages/$pkg/pubspec.yaml');
  if (!file.existsSync()) {
    return <String>{};
  }

  final lines = file.readAsLinesSync();
  final deps = <String>{};
  final sections = {'dependencies', 'dev_dependencies', 'dependency_overrides'};
  String? currentSection;

  for (final line in lines) {
    final sectionMatch = RegExp(r'^([a-zA-Z_][a-zA-Z0-9_]*):\s*$').firstMatch(line);
    if (sectionMatch != null) {
      final section = sectionMatch.group(1)!;
      currentSection = sections.contains(section) ? section : null;
      continue;
    }

    if (currentSection == null) {
      continue;
    }

    if (!line.startsWith(' ')) {
      currentSection = null;
      continue;
    }

    final depMatch = RegExp(r'^\s{2,}([a-zA-Z_][a-zA-Z0-9_]*):').firstMatch(line);
    if (depMatch == null) {
      continue;
    }

    final depName = depMatch.group(1)!;
    if (localPackages.contains(depName) && depName != pkg) {
      deps.add(depName);
    }
  }

  return deps;
}

List<List<String>> _findCycles(
  List<String> packages,
  Map<String, Set<String>> dependencies,
) {
  final state = <String, int>{for (final pkg in packages) pkg: 0};
  final stack = <String>[];
  final cycles = <List<String>>[];
  final cycleKeys = <String>{};

  void dfs(String node) {
    state[node] = 1;
    stack.add(node);

    for (final next in dependencies[node] ?? const <String>{}) {
      final nextState = state[next] ?? 0;
      if (nextState == 0) {
        dfs(next);
      } else if (nextState == 1) {
        final start = stack.indexOf(next);
        if (start >= 0) {
          final cycle = stack.sublist(start);
          final key = _canonicalCycleKey(cycle);
          if (cycleKeys.add(key)) {
            cycles.add(cycle);
          }
        }
      }
    }

    stack.removeLast();
    state[node] = 2;
  }

  for (final pkg in packages) {
    if (state[pkg] == 0) {
      dfs(pkg);
    }
  }

  return cycles;
}

String _canonicalCycleKey(List<String> cycle) {
  if (cycle.length <= 1) {
    return cycle.join('->');
  }

  final rotations = <String>[];
  for (var i = 0; i < cycle.length; i++) {
    final rotated = [...cycle.sublist(i), ...cycle.sublist(0, i)];
    rotations.add(rotated.join('->'));
  }

  final reversed = cycle.reversed.toList();
  for (var i = 0; i < reversed.length; i++) {
    final rotated = [...reversed.sublist(i), ...reversed.sublist(0, i)];
    rotations.add(rotated.join('->'));
  }

  rotations.sort();
  return rotations.first;
}

Set<String> _transitiveDependents(
  String pkg,
  Map<String, Set<String>> dependents,
) {
  final visited = <String>{};
  final queue = Queue<String>()..addAll(dependents[pkg] ?? const <String>{});

  while (queue.isNotEmpty) {
    final current = queue.removeFirst();
    if (!visited.add(current)) {
      continue;
    }
    queue.addAll(dependents[current] ?? const <String>{});
  }

  return visited;
}

Future<List<String>> _directlyChangedPackages(String base, List<String> packageNames) async {
  final result = await Process.run(
    'git',
    ['diff', '--name-only', base, '--', 'packages/'],
    runInShell: false,
  );

  if (result.exitCode != 0) {
    stderr.writeln('Failed to compute changed files against $base.');
    return const [];
  }

  final localPackages = packageNames.toSet();
  final changed = <String>{};
  final lines = (result.stdout as String).split('\n');
  final matcher = RegExp(r'^packages/([^/]+)/');

  for (final line in lines) {
    final match = matcher.firstMatch(line.trim());
    if (match == null) {
      continue;
    }
    final pkg = match.group(1)!;
    if (localPackages.contains(pkg)) {
      changed.add(pkg);
    }
  }

  final sorted = changed.toList()..sort();
  return sorted;
}

_Options _parseArgs(List<String> args) {
  String? base;
  int? maxAffected;
  int? maxBlastRadius;
  var showHelp = false;

  for (var i = 0; i < args.length; i++) {
    final arg = args[i];
    switch (arg) {
      case '-h':
      case '--help':
        showHelp = true;
        break;
      case '--base':
        if (i + 1 < args.length) {
          base = args[++i];
        }
        break;
      case '--max-affected':
        if (i + 1 < args.length) {
          maxAffected = int.tryParse(args[++i]);
        }
        break;
      case '--max-blast-radius':
        if (i + 1 < args.length) {
          maxBlastRadius = int.tryParse(args[++i]);
        }
        break;
      default:
        // Ignore unknown flags to keep script friendly in demos.
        break;
    }
  }

  return _Options(
    base: base,
    maxAffected: maxAffected,
    maxBlastRadius: maxBlastRadius,
    showHelp: showHelp,
  );
}

void _printUsage() {
  stdout.writeln('Usage: dart run tool/check_package_structure.dart [options]');
  stdout.writeln('');
  stdout.writeln('Options:');
  stdout.writeln('  --base <branch>             Compare changed packages against a base branch');
  stdout.writeln('  --max-affected <n>          Fail if affected package count exceeds n');
  stdout.writeln('  --max-blast-radius <n>      Fail if any package has more than n dependents');
  stdout.writeln('  -h, --help                  Show this help');
}

class _Options {
  const _Options({
    required this.base,
    required this.maxAffected,
    required this.maxBlastRadius,
    required this.showHelp,
  });

  final String? base;
  final int? maxAffected;
  final int? maxBlastRadius;
  final bool showHelp;
}