#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

/// Generates additional test files to push total past 200+
/// and ensure the baseline is painfully slow (~4+ minutes).
void main() {
  final root = Directory.current.path;
  final packages = ['app', 'core', 'payments', 'analytics'];

  for (final pkg in packages) {
    final pkgDir = '$root/packages/$pkg';

    // Generate extra model-like source + test files
    for (var i = 0; i < 8; i++) {
      final name = '${pkg}_data_entity_$i';
      final className = '${_capitalize(pkg)}DataEntity$i';

      // Source file
      _write('$pkgDir/lib/src/models/$name.dart', '''
import 'package:equatable/equatable.dart';

class $className extends Equatable {
  final String id;
  final String label;
  final int sortOrder;
  final bool isEnabled;
  final double score;

  const $className({
    required this.id,
    required this.label,
    required this.sortOrder,
    required this.isEnabled,
    required this.score,
  });

  factory $className.fromJson(Map<String, dynamic> json) {
    return $className(
      id: json['id'] as String,
      label: json['label'] as String,
      sortOrder: json['sortOrder'] as int,
      isEnabled: json['isEnabled'] as bool,
      score: (json['score'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
    'sortOrder': sortOrder,
    'isEnabled': isEnabled,
    'score': score,
  };

  $className copyWith({
    String? id,
    String? label,
    int? sortOrder,
    bool? isEnabled,
    double? score,
  }) => $className(
    id: id ?? this.id,
    label: label ?? this.label,
    sortOrder: sortOrder ?? this.sortOrder,
    isEnabled: isEnabled ?? this.isEnabled,
    score: score ?? this.score,
  );

  @override
  List<Object?> get props => [id, label, sortOrder, isEnabled, score];
}
''');

      // Test file — mix of good and bad tests
      final hasDelay = i % 2 == 0;
      final hasHeavySetup = i % 3 == 0;

      final testBuf = StringBuffer();
      testBuf.writeln("import 'package:flutter_test/flutter_test.dart';");
      testBuf.writeln("import 'package:$pkg/src/models/$name.dart';");
      testBuf.writeln();
      testBuf.writeln('void main() {');

      if (hasHeavySetup) {
        testBuf.writeln("  group('$className with setup', () {");
        testBuf.writeln('    late $className entity;');
        testBuf.writeln('    setUp(() async {');
        testBuf.writeln('      await Future.delayed(const Duration(milliseconds: 500));');
        testBuf.writeln("      entity = $className(id: 'e$i', label: 'Entity $i', sortOrder: $i, isEnabled: true, score: ${i * 1.5});");
        testBuf.writeln('    });');
        for (var j = 0; j < 4; j++) {
          testBuf.writeln("    test('setup validation $j', () { expect(entity, isNotNull); });");
        }
        testBuf.writeln('  });');
        testBuf.writeln();
      }

      testBuf.writeln("  group('$className', () {");
      testBuf.writeln("    test('creates from json', () {");
      testBuf.writeln("      final m = $className.fromJson({'id': 'x', 'label': 'y', 'sortOrder': 1, 'isEnabled': true, 'score': 1.0});");
      testBuf.writeln("      expect(m.id, 'x');");
      testBuf.writeln('    });');
      testBuf.writeln("    test('converts to json', () {");
      testBuf.writeln("      final m = $className(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);");
      testBuf.writeln("      expect(m.toJson()['id'], 'a');");
      testBuf.writeln('    });');
      testBuf.writeln("    test('supports copyWith', () {");
      testBuf.writeln("      final m = $className(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);");
      testBuf.writeln('      expect(m.copyWith(), m);');
      testBuf.writeln('    });');
      testBuf.writeln("    test('supports equality', () {");
      testBuf.writeln("      final a = $className(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);");
      testBuf.writeln("      final b = $className(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);");
      testBuf.writeln('      expect(a, b);');
      testBuf.writeln('    });');

      if (hasDelay) {
        testBuf.writeln("    test('validates after processing', () async {");
        testBuf.writeln("      final m = $className(id: 'a', label: 'b', sortOrder: 0, isEnabled: false, score: 0.0);");
        testBuf.writeln('      await Future.delayed(const Duration(seconds: 2));');
        testBuf.writeln('      expect(m.toJson(), isNotNull);');
        testBuf.writeln('    });');
      }

      testBuf.writeln('  });');
      testBuf.writeln('}');

      _write('$pkgDir/test/models/${name}_test.dart', testBuf.toString());
    }

    // Generate extra widget test files with slow patterns
    for (var i = 0; i < 5; i++) {
      final name = '${pkg}_screen_$i';
      final className = '${_capitalize(pkg)}Screen$i';

      _write('$pkgDir/lib/src/widgets/$name.dart', '''
import 'package:flutter/material.dart';

class $className extends StatelessWidget {
  const $className({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text('$className', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 16),
          for (int i = 0; i < 5; i++)
            ListTile(title: Text('Item \$i'), leading: const Icon(Icons.circle)),
        ],
      ),
    );
  }
}
''');

      final testBuf = StringBuffer();
      testBuf.writeln("import 'package:flutter/material.dart';");
      testBuf.writeln("import 'package:flutter_test/flutter_test.dart';");
      testBuf.writeln("import 'package:$pkg/src/widgets/$name.dart';");
      testBuf.writeln();
      testBuf.writeln('void main() {');
      testBuf.writeln("  group('$className', () {");
      testBuf.writeln("    testWidgets('renders', (tester) async {");
      testBuf.writeln('      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: $className()))));');
      testBuf.writeln('      await tester.pumpAndSettle();');
      testBuf.writeln('      expect(find.byType($className), findsOneWidget);');
      testBuf.writeln('    });');

      // BAD: excessive pumping
      if (i % 2 == 0) {
        testBuf.writeln("    testWidgets('stress renders', (tester) async {");
        testBuf.writeln('      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: $className()))));');
        testBuf.writeln('      for (int j = 0; j < 100; j++) {');
        testBuf.writeln('        await tester.pump(const Duration(milliseconds: 16));');
        testBuf.writeln('      }');
        testBuf.writeln('      expect(find.byType($className), findsOneWidget);');
        testBuf.writeln('    });');
      }

      testBuf.writeln('  });');
      testBuf.writeln('}');

      _write('$pkgDir/test/widgets/${name}_test.dart', testBuf.toString());
    }
  }

  // Count totals
  var totalSrc = 0;
  var totalTest = 0;
  for (final pkg in packages) {
    final srcCount = Directory('$root/packages/$pkg/lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))
        .length;
    final testCount = Directory('$root/packages/$pkg/test')
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('_test.dart'))
        .length;
    totalSrc += srcCount;
    totalTest += testCount;
    print('  $pkg: $srcCount source, $testCount test files');
  }
  print('Total: $totalSrc source files, $totalTest test files');
}

String _capitalize(String s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

void _write(String path, String content) {
  final file = File(path);
  file.parent.createSync(recursive: true);
  file.writeAsStringSync(content);
}
