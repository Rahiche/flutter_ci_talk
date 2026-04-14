import 'dart:io';

import 'package:test/test.dart';
import 'package:test_bundler/test_bundler.dart';

void main() {
  test('generates one wrapper file for each package by default', () {
    final temp = Directory.systemTemp.createTempSync('test_bundler_test_');
    addTearDown(() {
      if (temp.existsSync()) {
        temp.deleteSync(recursive: true);
      }
    });

    final packageTestDir = Directory('${temp.path}/packages/app/test')
      ..createSync(recursive: true);

    File(
      '${packageTestDir.path}/a_test.dart',
    ).writeAsStringSync('void main() {}');
    File('${packageTestDir.path}/nested/b_test.dart')
      ..createSync(recursive: true)
      ..writeAsStringSync('void main() {}');

    final result = generateTestBundles(BundleConfig(rootPath: temp.path));

    expect(result.packageCount, 1);
    expect(result.totalTestFiles, 2);

    final output = File('${packageTestDir.path}/all_tests.dart');
    expect(output.existsSync(), isTrue);
    final content = output.readAsStringSync();
    expect(content, contains("import 'a_test.dart' as test_0;"));
    expect(content, contains("import 'nested/b_test.dart' as test_1;"));
  });

  test('generates sharded wrappers', () {
    final temp = Directory.systemTemp.createTempSync('test_bundler_test_');
    addTearDown(() {
      if (temp.existsSync()) {
        temp.deleteSync(recursive: true);
      }
    });

    final packageTestDir = Directory('${temp.path}/packages/core/test')
      ..createSync(recursive: true);

    for (var i = 0; i < 5; i++) {
      File(
        '${packageTestDir.path}/f${i}_test.dart',
      ).writeAsStringSync('void main() {}');
    }

    final result = generateTestBundles(
      BundleConfig(rootPath: temp.path, shards: 2),
    );

    expect(result.packageCount, 1);
    expect(
      File('${packageTestDir.path}/all_tests_shard_1.dart').existsSync(),
      isTrue,
    );
    expect(
      File('${packageTestDir.path}/all_tests_shard_2.dart').existsSync(),
      isTrue,
    );
  });
}
