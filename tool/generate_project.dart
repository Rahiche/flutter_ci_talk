#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

/// Generates the entire flutter_ci_talk demo project.
/// Targets ~200+ test files with intentionally slow tests on main branch
/// to create a baseline of ~4+ minutes.
void main(List<String> args) {
  final root = Directory.current.path;
  print('Generating project in: $root');

  _generateRootFiles(root);

  for (final pkg in _packages) {
    _generatePackage(root, pkg);
  }

  print('Done! Generated project structure.');
}

// ============================================================
// Package configs — each designed to produce ~50+ source files
// ============================================================

final _packages = [
  _PackageConfig(
    name: 'app',
    description: 'Main application package',
    models: [
      'UserModel', 'ProfileModel', 'SettingsModel', 'NotificationModel',
      'SessionModel', 'AddressModel', 'PreferenceModel', 'DeviceModel',
      'TokenModel', 'AuditLogModel',
    ],
    services: [
      'AuthService', 'UserService', 'NotificationService', 'SessionService',
      'PreferenceService', 'DeviceService',
    ],
    repos: [
      'AuthRepository', 'UserRepository', 'NotificationRepository',
      'SessionRepository', 'PreferenceRepository',
    ],
    cubits: [
      'AuthCubit', 'ProfileCubit', 'SettingsCubit', 'NotificationCubit',
      'SessionCubit', 'OnboardingCubit',
    ],
    widgets: [
      'LoginForm', 'ProfileCard', 'SettingsPage', 'NotificationList',
      'AppDrawer', 'DashboardHeader', 'UserAvatar', 'WelcomeBanner',
      'SplashScreen', 'OnboardingPage',
    ],
  ),
  _PackageConfig(
    name: 'core',
    description: 'Shared UI components',
    models: [
      'ApiResponse', 'PaginationModel', 'ErrorModel', 'ThemeConfig',
      'AppConfig', 'FeatureFlag', 'RouteConfig', 'LocaleModel',
      'CacheEntry', 'LogEntry',
    ],
    services: [
      'HttpClient', 'CacheService', 'LoggerService', 'StorageService',
      'ConnectivityService', 'EncryptionService',
    ],
    repos: [
      'ConfigRepository', 'FeatureFlagRepository', 'ThemeRepository',
      'CacheRepository', 'LogRepository',
    ],
    cubits: [
      'ThemeCubit', 'ConnectivityCubit', 'LocaleCubit',
      'NavigationCubit', 'VersionCubit', 'PermissionCubit',
    ],
    widgets: [
      'LoadingIndicator', 'ErrorDisplay', 'EmptyState', 'CustomAppBar',
      'BottomNavBar', 'AppSearchField', 'InfoCard', 'ConfirmDialog',
      'BadgeIcon', 'ProgressBar',
    ],
  ),
  _PackageConfig(
    name: 'payments',
    description: 'Payment feature package',
    models: [
      'PaymentModel', 'TransactionModel', 'InvoiceModel', 'AccountModel',
      'RefundModel', 'CardModel', 'SubscriptionModel', 'DiscountModel',
      'TaxModel', 'ReceiptModel', 'WalletModel', 'BankAccountModel',
    ],
    services: [
      'PaymentService', 'InvoiceService', 'TransactionService',
      'CardService', 'SubscriptionService', 'RefundService', 'WalletService',
    ],
    repos: [
      'PaymentRepository', 'InvoiceRepository', 'AccountRepository',
      'CardRepository', 'SubscriptionRepository', 'WalletRepository',
    ],
    cubits: [
      'PaymentCubit', 'InvoiceCubit', 'AccountCubit',
      'CardCubit', 'SubscriptionCubit', 'CheckoutCubit', 'RefundCubit',
    ],
    widgets: [
      'PaymentForm', 'TransactionList', 'InvoiceCard', 'AccountSummary',
      'RefundDialog', 'CardSelector', 'CheckoutPage', 'ReceiptView',
      'SubscriptionCard', 'PaymentHistory', 'WalletBalance',
    ],
  ),
  _PackageConfig(
    name: 'analytics',
    description: 'Analytics feature package',
    models: [
      'EventModel', 'MetricModel', 'SessionDataModel', 'ConversionModel',
      'ReportModel', 'FunnelModel', 'CohortModel', 'SegmentModel',
      'DimensionModel', 'GoalModel',
    ],
    services: [
      'EventTracker', 'MetricsService', 'ReportService',
      'FunnelService', 'SegmentService', 'ExportService',
    ],
    repos: [
      'EventRepository', 'MetricsRepository', 'ReportRepository',
      'FunnelRepository', 'SegmentRepository',
    ],
    cubits: [
      'DashboardCubit', 'EventsCubit', 'ReportCubit',
      'FunnelCubit', 'SegmentCubit', 'RealTimeCubit',
    ],
    widgets: [
      'AnalyticsDashboard', 'EventList', 'MetricChart', 'ReportViewer',
      'ConversionFunnel', 'FilterPanel', 'DateRangePicker', 'KpiCard',
      'TrendLine', 'SegmentPicker', 'ExportButton',
    ],
  ),
];

class _PackageConfig {
  final String name;
  final String description;
  final List<String> models;
  final List<String> services;
  final List<String> repos;
  final List<String> cubits;
  final List<String> widgets;
  const _PackageConfig({
    required this.name,
    required this.description,
    required this.models,
    required this.services,
    required this.repos,
    required this.cubits,
    required this.widgets,
  });
}

// ============================================================
// Root files
// ============================================================

void _generateRootFiles(String root) {
  _write('$root/pubspec.yaml', '''
name: flutter_ci_talk
description: Demo project for Flutter CI optimization talk.
publish_to: 'none'

environment:
  sdk: ^3.9.0

workspace:
  - packages/app
  - packages/core
  - packages/payments
  - packages/analytics

dev_dependencies:
  melos: ^7.3.0
''');

  _write('$root/melos.yaml', '''
name: flutter_ci_talk
packages:
  - packages/*

command:
  bootstrap:
    usePubspecOverrides: true

scripts:
  test:
    run: melos exec -- flutter test
    packageFilters:
      dirExists: test
  test:coverage:
    run: melos exec -- flutter test --coverage
    packageFilters:
      dirExists: test
  analyze:
    run: melos exec -- dart analyze .
''');
}

// ============================================================
// Package generation
// ============================================================

void _generatePackage(String root, _PackageConfig pkg) {
  final dir = '$root/packages/${pkg.name}';

  for (final sub in [
    'lib/src/models', 'lib/src/services', 'lib/src/repositories',
    'lib/src/cubits', 'lib/src/widgets', 'lib/src/utils',
    'test/models', 'test/services', 'test/repositories',
    'test/cubits', 'test/widgets', 'test/utils',
  ]) {
    Directory('$dir/$sub').createSync(recursive: true);
  }

  // pubspec
  _write('$dir/pubspec.yaml', '''
name: ${pkg.name}
description: ${pkg.description}
publish_to: 'none'
resolution: workspace

environment:
  sdk: ^3.9.0
  flutter: ">=3.35.0"

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^9.1.0
  bloc: ^9.0.0
  equatable: ^2.0.7

dev_dependencies:
  flutter_test:
    sdk: flutter
  bloc_test: ^10.0.0
  flutter_lints: ^5.0.0
''');

  _write('$dir/analysis_options.yaml', 'include: package:flutter_lints/flutter.yaml\n');

  final exports = StringBuffer("library ${pkg.name};\n\n");
  var fileIndex = 0;

  // Models
  for (final name in pkg.models) {
    final snake = _toSnakeCase(name);
    final fields = _fieldsForModel(name, fileIndex);
    _write('$dir/lib/src/models/$snake.dart', _modelSource(name, fields));
    _write('$dir/test/models/${snake}_test.dart',
        _modelTest(pkg.name, name, snake, fields, fileIndex));
    exports.writeln("export 'src/models/$snake.dart';");
    fileIndex++;
  }

  // Services
  for (final name in pkg.services) {
    final snake = _toSnakeCase(name);
    final methods = _methodsForService(name, fileIndex);
    _write('$dir/lib/src/services/$snake.dart', _serviceSource(name, methods));
    _write('$dir/test/services/${snake}_test.dart',
        _serviceTest(pkg.name, name, snake, methods, fileIndex));
    exports.writeln("export 'src/services/$snake.dart';");
    fileIndex++;
  }

  // Repositories
  for (final name in pkg.repos) {
    final snake = _toSnakeCase(name);
    final iface = 'I$name';
    final methods = _methodsForRepo(name, fileIndex);
    _write('$dir/lib/src/repositories/$snake.dart',
        _repoSource(name, iface, methods));
    _write('$dir/test/repositories/${snake}_test.dart',
        _repoTest(pkg.name, name, snake, methods, fileIndex));
    exports.writeln("export 'src/repositories/$snake.dart';");
    fileIndex++;
  }

  // Cubits
  for (final name in pkg.cubits) {
    final snake = _toSnakeCase(name);
    final stateName = name.replaceAll('Cubit', 'State');
    final actions = _actionsForCubit(name);
    final delayMs = 50 + (fileIndex * 7) % 150;
    _write('$dir/lib/src/cubits/$snake.dart',
        _cubitSource(name, stateName, actions, delayMs));
    _write('$dir/test/cubits/${snake}_test.dart',
        _cubitTest(pkg.name, name, snake, stateName, actions, fileIndex));
    exports.writeln("export 'src/cubits/$snake.dart';");
    fileIndex++;
  }

  // Widgets
  for (final name in pkg.widgets) {
    final snake = _toSnakeCase(name);
    final isStateful = fileIndex % 3 == 0;
    _write('$dir/lib/src/widgets/$snake.dart',
        _widgetSource(name, isStateful, fileIndex));
    _write('$dir/test/widgets/${snake}_test.dart',
        _widgetTest(pkg.name, name, snake, isStateful, fileIndex));
    exports.writeln("export 'src/widgets/$snake.dart';");
    fileIndex++;
  }

  // Utility files (extra test files to bulk up the count)
  for (var i = 0; i < 6; i++) {
    final utilName = '${pkg.name}_utils_$i';
    _write('$dir/lib/src/utils/$utilName.dart', _utilSource(utilName, i));
    _write('$dir/test/utils/${utilName}_test.dart',
        _utilTest(pkg.name, utilName, i, fileIndex + i));
  }
  fileIndex += 6;

  // Generate the mega test file (intentionally bad — one huge file)
  _write('$dir/test/everything_test.dart',
      _everythingTest(pkg));

  // Generate second mega test file for even more slowness
  _write('$dir/test/integration_test.dart',
      _integrationTest(pkg));

  _write('$dir/lib/${pkg.name}.dart', exports.toString());

  final testCount = _countFiles('$dir/test', '_test.dart');
  final srcCount = _countFiles('$dir/lib', '.dart');
  print('  Generated package: ${pkg.name} ($srcCount source files, $testCount test files)');
}

int _countFiles(String dir, String suffix) {
  try {
    return Directory(dir)
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith(suffix))
        .length;
  } catch (_) {
    return 0;
  }
}

// ============================================================
// Field generation for models
// ============================================================

List<List<String>> _fieldsForModel(String name, int index) {
  // Returns list of [type, name, testValue]
  final base = <List<String>>[
    ['String', 'id', "'${_toSnakeCase(name).replaceAll('_model', '')}_${(index + 1).toString().padLeft(3, '0')}'"],
    ['String', 'name', "'Test ${name.replaceAll('Model', '')}'"],
  ];

  final extras = <List<List<String>>>[
    [['String', 'email', "'test@example.com'"], ['int', 'age', '${25 + index}'], ['bool', 'isActive', 'true']],
    [['double', 'amount', '${(index + 1) * 9.99}'], ['String', 'currency', "'USD'"], ['String', 'status', "'active'"]],
    [['int', 'count', '${index + 10}'], ['bool', 'enabled', 'true'], ['String', 'description', "'A ${name.replaceAll('Model', '')} item'"]],
    [['DateTime', 'createdAt', "'2024-01-15T10:30:00Z'"], ['String', 'type', "'default'"], ['int', 'priority', '${index % 5}']],
    [['double', 'value', '${(index + 1) * 1.5}'], ['String', 'category', "'general'"], ['bool', 'verified', 'false']],
  ];

  return [...base, ...extras[index % extras.length]];
}

// ============================================================
// Method generation for services/repos
// ============================================================

List<List<String>> _methodsForService(String name, int index) {
  // [methodName, returnType, delayMs, returnValue]
  return [
    ['fetch', 'Map<String, dynamic>', '${40 + index * 5}', "{'data': 'response'}"],
    ['create', 'bool', '${50 + index * 3}', 'true'],
    ['update', 'bool', '${30 + index * 4}', 'true'],
    ['delete', 'bool', '${20 + index * 2}', 'true'],
  ];
}

List<List<String>> _methodsForRepo(String name, int index) {
  return [
    ['getAll', 'List<String>', '${60 + index * 5}', "['item_1', 'item_2']"],
    ['getById', 'Map<String, dynamic>', '${40 + index * 3}', "{'id': '1'}"],
    ['save', 'bool', '${50 + index * 4}', 'true'],
  ];
}

List<String> _actionsForCubit(String name) {
  final base = name.replaceAll('Cubit', '').toLowerCase();
  return ['load$base', 'refresh$base', 'reset$base'];
}

// ============================================================
// Source generators
// ============================================================

String _modelSource(String name, List<List<String>> fields) {
  final buf = StringBuffer();
  buf.writeln("import 'package:equatable/equatable.dart';");
  buf.writeln();
  buf.writeln('class $name extends Equatable {');
  for (final f in fields) {
    buf.writeln('  final ${f[0]} ${f[1]};');
  }
  buf.writeln();
  buf.writeln('  const $name({');
  for (final f in fields) {
    buf.writeln('    required this.${f[1]},');
  }
  buf.writeln('  });');
  buf.writeln();

  // fromJson
  buf.writeln('  factory $name.fromJson(Map<String, dynamic> json) {');
  buf.writeln('    return $name(');
  for (final f in fields) {
    if (f[0] == 'DateTime') {
      buf.writeln("      ${f[1]}: DateTime.parse(json['${f[1]}'] as String),");
    } else if (f[0] == 'double') {
      buf.writeln("      ${f[1]}: (json['${f[1]}'] as num).toDouble(),");
    } else {
      buf.writeln("      ${f[1]}: json['${f[1]}'] as ${f[0]},");
    }
  }
  buf.writeln('    );');
  buf.writeln('  }');
  buf.writeln();

  // toJson
  buf.writeln('  Map<String, dynamic> toJson() {');
  buf.writeln('    return {');
  for (final f in fields) {
    if (f[0] == 'DateTime') {
      buf.writeln("      '${f[1]}': ${f[1]}.toIso8601String(),");
    } else {
      buf.writeln("      '${f[1]}': ${f[1]},");
    }
  }
  buf.writeln('    };');
  buf.writeln('  }');
  buf.writeln();

  // copyWith
  buf.writeln('  $name copyWith({');
  for (final f in fields) {
    buf.writeln('    ${f[0]}? ${f[1]},');
  }
  buf.writeln('  }) {');
  buf.writeln('    return $name(');
  for (final f in fields) {
    buf.writeln('      ${f[1]}: ${f[1]} ?? this.${f[1]},');
  }
  buf.writeln('    );');
  buf.writeln('  }');
  buf.writeln();

  buf.writeln('  @override');
  buf.writeln('  List<Object?> get props => [${fields.map((f) => f[1]).join(', ')}];');
  buf.writeln('}');
  return buf.toString();
}

String _modelTest(String pkg, String name, String snake, List<List<String>> fields, int index) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  buf.writeln("import 'package:$pkg/src/models/$snake.dart';");
  buf.writeln();
  buf.writeln('void main() {');
  buf.writeln("  group('$name', () {");

  // fromJson test
  buf.writeln("    test('should create from json', () {");
  buf.writeln('      final json = <String, dynamic>{');
  for (final f in fields) {
    buf.writeln("        '${f[1]}': ${f[2]},");
  }
  buf.writeln('      };');
  buf.writeln('      final model = $name.fromJson(json);');
  for (final f in fields) {
    if (f[0] == 'DateTime') {
      buf.writeln('      expect(model.${f[1]}, isA<DateTime>());');
    } else {
      buf.writeln('      expect(model.${f[1]}, ${f[2]});');
    }
  }
  buf.writeln('    });');

  // toJson test
  buf.writeln("    test('should convert to json', () {");
  buf.writeln('      final model = $name(');
  for (final f in fields) {
    if (f[0] == 'DateTime') {
      buf.writeln('        ${f[1]}: DateTime.parse(${f[2]}),');
    } else {
      buf.writeln('        ${f[1]}: ${f[2]},');
    }
  }
  buf.writeln('      );');
  buf.writeln('      final json = model.toJson();');
  for (final f in fields) {
    buf.writeln("      expect(json['${f[1]}'], isNotNull);");
  }
  buf.writeln('    });');

  // copyWith test
  buf.writeln("    test('supports copyWith', () {");
  buf.writeln('      final model = $name(');
  for (final f in fields) {
    if (f[0] == 'DateTime') {
      buf.writeln('        ${f[1]}: DateTime.parse(${f[2]}),');
    } else {
      buf.writeln('        ${f[1]}: ${f[2]},');
    }
  }
  buf.writeln('      );');
  buf.writeln('      final copy = model.copyWith();');
  buf.writeln('      expect(copy, model);');
  buf.writeln('    });');

  // Equality test
  buf.writeln("    test('supports equality', () {");
  buf.writeln('      final a = $name(');
  for (final f in fields) {
    if (f[0] == 'DateTime') {
      buf.writeln('        ${f[1]}: DateTime.parse(${f[2]}),');
    } else {
      buf.writeln('        ${f[1]}: ${f[2]},');
    }
  }
  buf.writeln('      );');
  buf.writeln('      final b = $name(');
  for (final f in fields) {
    if (f[0] == 'DateTime') {
      buf.writeln('        ${f[1]}: DateTime.parse(${f[2]}),');
    } else {
      buf.writeln('        ${f[1]}: ${f[2]},');
    }
  }
  buf.writeln('      );');
  buf.writeln('      expect(a, b);');
  buf.writeln('    });');

  // BAD test: unnecessary async delay on some models
  if (index % 4 == 0) {
    buf.writeln();
    buf.writeln("    test('validates data consistency after processing', () async {");
    buf.writeln('      final model = $name(');
    for (final f in fields) {
      if (f[0] == 'DateTime') {
        buf.writeln('        ${f[1]}: DateTime.parse(${f[2]}),');
      } else {
        buf.writeln('        ${f[1]}: ${f[2]},');
      }
    }
    buf.writeln('      );');
    buf.writeln('      await Future.delayed(const Duration(seconds: 2));');
    buf.writeln('      final json = model.toJson();');
    buf.writeln('      final restored = $name.fromJson(json);');
    buf.writeln('      expect(restored, model);');
    buf.writeln('    });');
  }

  buf.writeln('  });');
  buf.writeln('}');
  return buf.toString();
}

// ============================================================
// Service source/test
// ============================================================

String _serviceSource(String name, List<List<String>> methods) {
  final buf = StringBuffer();
  buf.writeln('class $name {');
  for (final m in methods) {
    buf.writeln('  Future<${m[1]}> ${m[0]}() async {');
    buf.writeln('    await Future.delayed(const Duration(milliseconds: ${m[2]}));');
    buf.writeln('    return ${m[3]};');
    buf.writeln('  }');
    buf.writeln();
  }
  buf.writeln('}');
  return buf.toString();
}

String _serviceTest(String pkg, String name, String snake, List<List<String>> methods, int index) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  buf.writeln("import 'package:$pkg/src/services/$snake.dart';");
  buf.writeln();
  buf.writeln('void main() {');

  // BAD: heavy setUp on some service tests
  if (index % 3 == 0) {
    buf.writeln("  group('$name with initialization', () {");
    buf.writeln('    late $name service;');
    buf.writeln();
    buf.writeln('    setUp(() async {');
    buf.writeln('      await Future.delayed(const Duration(milliseconds: 600));');
    buf.writeln('      service = $name();');
    buf.writeln('    });');
    buf.writeln();
    for (var i = 0; i < 5; i++) {
      buf.writeln("    test('basic validation $i', () {");
      buf.writeln('      expect(service, isNotNull);');
      buf.writeln('    });');
      buf.writeln();
    }
    buf.writeln('  });');
    buf.writeln();
  }

  buf.writeln("  group('$name', () {");
  buf.writeln('    late $name service;');
  buf.writeln();
  buf.writeln('    setUp(() {');
  buf.writeln('      service = $name();');
  buf.writeln('    });');
  buf.writeln();

  for (final m in methods) {
    buf.writeln("    test('${m[0]} returns result', () async {");
    buf.writeln('      final result = await service.${m[0]}();');
    buf.writeln('      expect(result, isNotNull);');
    buf.writeln('    });');
    buf.writeln();
  }

  buf.writeln('  });');
  buf.writeln('}');
  return buf.toString();
}

// ============================================================
// Repository source/test
// ============================================================

String _repoSource(String name, String iface, List<List<String>> methods) {
  final buf = StringBuffer();
  buf.writeln('abstract class $iface {');
  for (final m in methods) {
    buf.writeln('  Future<${m[1]}> ${m[0]}();');
  }
  buf.writeln('}');
  buf.writeln();
  buf.writeln('class $name implements $iface {');
  buf.writeln('  $name();');
  buf.writeln();
  for (final m in methods) {
    buf.writeln('  @override');
    buf.writeln('  Future<${m[1]}> ${m[0]}() async {');
    buf.writeln('    await Future.delayed(const Duration(milliseconds: ${m[2]}));');
    buf.writeln('    return ${m[3]};');
    buf.writeln('  }');
    buf.writeln();
  }
  buf.writeln('}');
  return buf.toString();
}

String _repoTest(String pkg, String name, String snake, List<List<String>> methods, int index) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  buf.writeln("import 'package:$pkg/src/repositories/$snake.dart';");
  buf.writeln();
  buf.writeln('void main() {');
  buf.writeln("  group('$name', () {");
  buf.writeln('    late $name repository;');
  buf.writeln();
  buf.writeln('    setUp(() {');
  buf.writeln('      repository = $name();');
  buf.writeln('    });');
  buf.writeln();

  for (final m in methods) {
    buf.writeln("    test('${m[0]} returns data', () async {");
    buf.writeln('      final result = await repository.${m[0]}();');
    buf.writeln('      expect(result, isNotNull);');
    buf.writeln('    });');
    buf.writeln();
  }

  // BAD: real I/O test on some repos
  if (index % 5 == 0) {
    buf.writeln("    test('caches results to disk', () async {");
    buf.writeln("      final dir = await Directory.systemTemp.createTemp('test_cache_');");
    buf.writeln("      final file = File('\${dir.path}/cache.json');");
    buf.writeln("      await file.writeAsString('{\"key\": \"value\"}');");
    buf.writeln('      final content = await file.readAsString();');
    buf.writeln("      expect(content, contains('key'));");
    buf.writeln('      await dir.delete(recursive: true);');
    buf.writeln('    });');
    // Need import
    buf.writeln();
  }

  buf.writeln('  });');
  buf.writeln('}');

  // Patch: add dart:io import if needed
  if (index % 5 == 0) {
    return "import 'dart:io';\n$buf";
  }
  return buf.toString();
}

// ============================================================
// Cubit source/test
// ============================================================

String _cubitSource(String name, String stateName, List<String> actions, int delayMs) {
  final buf = StringBuffer();
  buf.writeln("import 'package:bloc/bloc.dart';");
  buf.writeln("import 'package:equatable/equatable.dart';");
  buf.writeln();
  buf.writeln('sealed class $stateName extends Equatable {');
  buf.writeln('  const $stateName();');
  buf.writeln('  @override');
  buf.writeln('  List<Object?> get props => [];');
  buf.writeln('}');
  buf.writeln('class ${stateName}Initial extends $stateName {}');
  buf.writeln('class ${stateName}Loading extends $stateName {}');
  buf.writeln('class ${stateName}Success extends $stateName {');
  buf.writeln('  final String data;');
  buf.writeln('  const ${stateName}Success(this.data);');
  buf.writeln('  @override');
  buf.writeln('  List<Object?> get props => [data];');
  buf.writeln('}');
  buf.writeln('class ${stateName}Error extends $stateName {');
  buf.writeln('  final String message;');
  buf.writeln('  const ${stateName}Error(this.message);');
  buf.writeln('  @override');
  buf.writeln('  List<Object?> get props => [message];');
  buf.writeln('}');
  buf.writeln();
  buf.writeln('class $name extends Cubit<$stateName> {');
  buf.writeln('  $name() : super(${stateName}Initial());');
  buf.writeln();
  for (final action in actions) {
    buf.writeln('  Future<void> $action() async {');
    buf.writeln('    emit(${stateName}Loading());');
    buf.writeln('    try {');
    buf.writeln('      await Future.delayed(const Duration(milliseconds: $delayMs));');
    buf.writeln("      emit(const ${stateName}Success('$action done'));");
    buf.writeln('    } catch (e) {');
    buf.writeln('      emit(${stateName}Error(e.toString()));');
    buf.writeln('    }');
    buf.writeln('  }');
    buf.writeln();
  }
  buf.writeln('}');
  return buf.toString();
}

String _cubitTest(String pkg, String name, String snake, String stateName, List<String> actions, int index) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  buf.writeln("import 'package:bloc_test/bloc_test.dart';");
  buf.writeln("import 'package:$pkg/src/cubits/$snake.dart';");
  buf.writeln();
  buf.writeln('void main() {');
  buf.writeln("  group('$name', () {");

  buf.writeln("    test('initial state is ${stateName}Initial', () {");
  buf.writeln('      final cubit = $name();');
  buf.writeln('      expect(cubit.state, isA<${stateName}Initial>());');
  buf.writeln('      cubit.close();');
  buf.writeln('    });');
  buf.writeln();

  for (final action in actions) {
    buf.writeln("    blocTest<$name, $stateName>(");
    buf.writeln("      'emits [Loading, Success] when $action succeeds',");
    buf.writeln('      build: () => $name(),');
    buf.writeln('      act: (cubit) => cubit.$action(),');
    buf.writeln('      expect: () => [');
    buf.writeln('        isA<${stateName}Loading>(),');
    buf.writeln('        isA<${stateName}Success>(),');
    buf.writeln('      ],');
    buf.writeln('    );');
    buf.writeln();
  }

  // BAD: real async delay test on some cubits
  if (index % 2 == 0) {
    buf.writeln("    test('completes full cycle with delay', () async {");
    buf.writeln('      final cubit = $name();');
    buf.writeln('      cubit.${actions.first}();');
    buf.writeln('      await Future.delayed(const Duration(seconds: 3));');
    buf.writeln('      expect(cubit.state, isA<${stateName}Success>());');
    buf.writeln('      await cubit.close();');
    buf.writeln('    });');
    buf.writeln();
  }

  buf.writeln('  });');
  buf.writeln('}');
  return buf.toString();
}

// ============================================================
// Widget source/test
// ============================================================

String _widgetSource(String name, bool isStateful, int index) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter/material.dart';");
  buf.writeln();

  final body = _widgetBody(name, index);

  if (isStateful) {
    buf.writeln('class $name extends StatefulWidget {');
    buf.writeln('  const $name({super.key});');
    buf.writeln('  @override');
    buf.writeln('  State<$name> createState() => _${name}State();');
    buf.writeln('}');
    buf.writeln();
    buf.writeln('class _${name}State extends State<$name> {');
    buf.writeln('  bool _loading = true;');
    buf.writeln();
    buf.writeln('  @override');
    buf.writeln('  void initState() {');
    buf.writeln('    super.initState();');
    buf.writeln('    Future.delayed(const Duration(milliseconds: 100), () {');
    buf.writeln('      if (mounted) setState(() => _loading = false);');
    buf.writeln('    });');
    buf.writeln('  }');
    buf.writeln();
    buf.writeln('  @override');
    buf.writeln('  Widget build(BuildContext context) {');
    buf.writeln('    if (_loading) return const Center(child: CircularProgressIndicator());');
    buf.writeln(body);
    buf.writeln('  }');
    buf.writeln('}');
  } else {
    buf.writeln('class $name extends StatelessWidget {');
    buf.writeln('  const $name({super.key});');
    buf.writeln('  @override');
    buf.writeln('  Widget build(BuildContext context) {');
    buf.writeln(body);
    buf.writeln('  }');
    buf.writeln('}');
  }
  return buf.toString();
}

String _widgetBody(String name, int index) {
  final bodies = [
    "    return const Center(child: Text('$name'));",
    "    return const Card(child: Padding(padding: EdgeInsets.all(16), child: Text('$name')));",
    "    return ListView(children: const [ListTile(title: Text('Item 1')), ListTile(title: Text('Item 2')), ListTile(title: Text('Item 3'))]);",
    "    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.star, size: 48), SizedBox(height: 8), Text('$name')]);",
    "    return const Padding(padding: EdgeInsets.all(16), child: Column(children: [Text('$name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), SizedBox(height: 16), Text('Content goes here')]));",
  ];
  return bodies[index % bodies.length];
}

String _widgetTest(String pkg, String name, String snake, bool isStateful, int index) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter/material.dart';");
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  buf.writeln("import 'package:$pkg/src/widgets/$snake.dart';");
  buf.writeln();
  buf.writeln('void main() {');
  buf.writeln("  group('$name', () {");

  // Standard good test
  buf.writeln("    testWidgets('renders without error', (tester) async {");
  buf.writeln('      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: $name())));');
  if (isStateful) {
    buf.writeln('      await tester.pump(const Duration(milliseconds: 200));');
  } else {
    buf.writeln('      await tester.pumpAndSettle();');
  }
  buf.writeln('      expect(find.byType($name), findsOneWidget);');
  buf.writeln('    });');

  buf.writeln("    testWidgets('builds correctly', (tester) async {");
  buf.writeln('      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: $name())));');
  if (isStateful) {
    buf.writeln('      await tester.pump(const Duration(milliseconds: 200));');
  } else {
    buf.writeln('      await tester.pumpAndSettle();');
  }
  buf.writeln('      expect(find.byType($name), findsOneWidget);');
  buf.writeln('    });');

  // BAD: excessive pumping on some widgets
  if (index % 4 == 0) {
    buf.writeln();
    buf.writeln("    testWidgets('animation stress test', (tester) async {");
    buf.writeln('      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: $name())));');
    buf.writeln('      for (int i = 0; i < 120; i++) {');
    buf.writeln('        await tester.pump(const Duration(milliseconds: 16));');
    buf.writeln('      }');
    buf.writeln('      expect(find.byType($name), findsOneWidget);');
    buf.writeln('    });');
  }

  buf.writeln('  });');
  buf.writeln('}');
  return buf.toString();
}

// ============================================================
// Utility source/test (extra files)
// ============================================================

String _utilSource(String name, int index) {
  final buf = StringBuffer();
  final funcNames = ['validate', 'format', 'parse', 'transform', 'normalize'];
  for (var i = 0; i < 4; i++) {
    final fn = '${funcNames[i % funcNames.length]}${name.split('_').last.capitalize()}$i';
    buf.writeln('String $fn(String input) {');
    buf.writeln("  if (input.isEmpty) return 'invalid';");
    buf.writeln('  return input.trim().toLowerCase();');
    buf.writeln('}');
    buf.writeln();
    buf.writeln('bool check${name.split('_').last.capitalize()}$i(dynamic value) {');
    buf.writeln('  return value != null;');
    buf.writeln('}');
    buf.writeln();
  }
  return buf.toString();
}

String _utilTest(String pkg, String name, int utilIndex, int fileIndex) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  buf.writeln("import 'package:$pkg/src/utils/$name.dart';");
  buf.writeln();
  buf.writeln('void main() {');

  final funcNames = ['validate', 'format', 'parse', 'transform', 'normalize'];
  for (var i = 0; i < 4; i++) {
    final fn = '${funcNames[i % funcNames.length]}${name.split('_').last.capitalize()}$i';
    buf.writeln("  group('$fn', () {");
    buf.writeln("    test('returns lowercase trimmed string', () {");
    buf.writeln("      expect($fn('  HELLO  '), 'hello');");
    buf.writeln('    });');
    buf.writeln("    test('returns invalid for empty input', () {");
    buf.writeln("      expect($fn(''), 'invalid');");
    buf.writeln('    });');

    // BAD: async delay on some util tests
    if (fileIndex % 3 == 0 && i == 0) {
      buf.writeln("    test('processes after debounce', () async {");
      buf.writeln('      await Future.delayed(const Duration(seconds: 2));');
      buf.writeln("      expect($fn('test'), 'test');");
      buf.writeln('    });');
    }

    buf.writeln('  });');
    buf.writeln();

    buf.writeln("  test('check${name.split('_').last.capitalize()}$i validates non-null', () {");
    buf.writeln("    expect(check${name.split('_').last.capitalize()}$i('value'), isTrue);");
    buf.writeln("    expect(check${name.split('_').last.capitalize()}$i(null), isFalse);");
    buf.writeln('  });');
    buf.writeln();
  }

  buf.writeln('}');
  return buf.toString();
}

// ============================================================
// Mega test files (intentionally bad)
// ============================================================

String _everythingTest(_PackageConfig pkg) {
  final buf = StringBuffer();
  buf.writeln("import 'dart:io';");
  buf.writeln("import 'package:flutter/material.dart';");
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");

  // Import cubits
  for (final c in pkg.cubits) {
    buf.writeln("import 'package:${pkg.name}/src/cubits/${_toSnakeCase(c)}.dart';");
  }
  // Import services
  for (final s in pkg.services) {
    buf.writeln("import 'package:${pkg.name}/src/services/${_toSnakeCase(s)}.dart';");
  }
  // Import models
  for (final m in pkg.models) {
    buf.writeln("import 'package:${pkg.name}/src/models/${_toSnakeCase(m)}.dart';");
  }
  buf.writeln();
  buf.writeln('void main() {');

  // Category 1: Real async delays — 3 seconds each, many tests
  buf.writeln("  group('Integration Tests', () {");
  for (final c in pkg.cubits) {
    final stateName = c.replaceAll('Cubit', 'State');
    final actions = _actionsForCubit(c);
    for (final action in actions) {
      buf.writeln("    test('$c.$action completes after delay', () async {");
      buf.writeln('      final cubit = $c();');
      buf.writeln('      cubit.$action();');
      buf.writeln('      await Future.delayed(const Duration(seconds: 3));');
      buf.writeln('      expect(cubit.state, isA<${stateName}Success>());');
      buf.writeln('      await cubit.close();');
      buf.writeln('    });');
      buf.writeln();
    }
  }
  buf.writeln('  });');

  // Category 2: Heavy setUp
  buf.writeln("  group('Service Validation', () {");
  for (final s in pkg.services) {
    buf.writeln("    group('$s setup', () {");
    buf.writeln('      late $s service;');
    buf.writeln('      setUp(() async {');
    buf.writeln('        await Future.delayed(const Duration(milliseconds: 700));');
    buf.writeln('        service = $s();');
    buf.writeln('      });');
    for (var i = 0; i < 5; i++) {
      buf.writeln("      test('validation $i', () {");
      buf.writeln('        expect(service, isNotNull);');
      buf.writeln('      });');
    }
    buf.writeln('    });');
  }
  buf.writeln('  });');

  // Category 3: Real I/O
  buf.writeln("  group('Cache Tests', () {");
  for (var i = 0; i < 3; i++) {
    buf.writeln("    test('disk cache test $i', () async {");
    buf.writeln("      final dir = await Directory.systemTemp.createTemp('test_$i');");
    buf.writeln("      final file = File('\${dir.path}/data.json');");
    buf.writeln("      await file.writeAsString('{\"index\": $i}');");
    buf.writeln('      final content = await file.readAsString();');
    buf.writeln("      expect(content, contains('index'));");
    buf.writeln('      await dir.delete(recursive: true);');
    buf.writeln('    });');
  }
  buf.writeln('  });');

  // Category 5: Excessive pumping
  buf.writeln("  group('Widget Stress', () {");
  for (var i = 0; i < 3; i++) {
    buf.writeln("    testWidgets('pump stress $i', (tester) async {");
    buf.writeln("      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Text('stress $i'))));");
    buf.writeln('      for (int j = 0; j < 100; j++) {');
    buf.writeln('        await tester.pump(const Duration(milliseconds: 16));');
    buf.writeln('      }');
    buf.writeln("      expect(find.text('stress $i'), findsOneWidget);");
    buf.writeln('    });');
  }
  buf.writeln('  });');

  // Good tests
  for (final m in pkg.models) {
    final fields = _fieldsForModel(m, pkg.models.indexOf(m));
    buf.writeln("  test('$m round-trip', () {");
    buf.writeln('    final json = <String, dynamic>{');
    for (final f in fields) {
      buf.writeln("      '${f[1]}': ${f[2]},");
    }
    buf.writeln('    };');
    buf.writeln('    final model = $m.fromJson(json);');
    buf.writeln('    final output = model.toJson();');
    for (final f in fields) {
      buf.writeln("    expect(output['${f[1]}'], isNotNull);");
    }
    buf.writeln('  });');
  }

  buf.writeln('}');
  return buf.toString();
}

String _integrationTest(_PackageConfig pkg) {
  final buf = StringBuffer();
  buf.writeln("import 'package:flutter/material.dart';");
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  for (final c in pkg.cubits) {
    buf.writeln("import 'package:${pkg.name}/src/cubits/${_toSnakeCase(c)}.dart';");
  }
  for (final s in pkg.services) {
    buf.writeln("import 'package:${pkg.name}/src/services/${_toSnakeCase(s)}.dart';");
  }
  buf.writeln();
  buf.writeln('void main() {');

  // More slow async tests
  buf.writeln("  group('End-to-end flow', () {");
  for (final c in pkg.cubits) {
    final stateName = c.replaceAll('Cubit', 'State');
    final actions = _actionsForCubit(c);
    buf.writeln("    test('$c full lifecycle', () async {");
    buf.writeln('      final cubit = $c();');
    for (final action in actions) {
      buf.writeln('      cubit.$action();');
      buf.writeln('      await Future.delayed(const Duration(seconds: 2));');
      buf.writeln('      expect(cubit.state, isA<${stateName}Success>());');
    }
    buf.writeln('      await cubit.close();');
    buf.writeln('    });');
    buf.writeln();
  }
  buf.writeln('  });');

  // Heavy setUp group
  buf.writeln("  group('Service lifecycle', () {");
  for (final s in pkg.services) {
    buf.writeln("    group('$s lifecycle', () {");
    buf.writeln('      late $s service;');
    buf.writeln('      setUp(() async {');
    buf.writeln('        await Future.delayed(const Duration(milliseconds: 500));');
    buf.writeln('        service = $s();');
    buf.writeln('      });');
    for (var i = 0; i < 4; i++) {
      buf.writeln("      test('lifecycle check $i', () {");
      buf.writeln('        expect(service, isNotNull);');
      buf.writeln('      });');
    }
    buf.writeln('    });');
  }
  buf.writeln('  });');

  // Excessive widget pumps
  buf.writeln("  group('Widget rendering', () {");
  for (var i = 0; i < 4; i++) {
    buf.writeln("    testWidgets('render cycle $i', (tester) async {");
    buf.writeln("      await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('render $i'))));");
    buf.writeln('      for (int j = 0; j < 80; j++) {');
    buf.writeln('        await tester.pump(const Duration(milliseconds: 16));');
    buf.writeln('      }');
    buf.writeln("      expect(find.text('render $i'), findsOneWidget);");
    buf.writeln('    });');
  }
  buf.writeln('  });');

  buf.writeln('}');
  return buf.toString();
}

// ============================================================
// Utilities
// ============================================================

String _toSnakeCase(String name) {
  return name
      .replaceAllMapped(
          RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}')
      .substring(1);
}

void _write(String path, String content) {
  final file = File(path);
  file.parent.createSync(recursive: true);
  file.writeAsStringSync(content);
}

extension on String {
  String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}
