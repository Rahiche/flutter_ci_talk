import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/no_raw_text.dart';

/// Entry point that `custom_lint` looks for when it loads this package.
PluginBase createPlugin() => _CiLints();

class _CiLints extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => const [NoRawText()];
}
