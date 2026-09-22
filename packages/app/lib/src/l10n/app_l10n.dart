import 'package:flutter/widgets.dart';

/// Stand-in for the class `flutter gen-l10n` produces from the .arb files.
///
/// Kept hand-written here so the repo stays buildable without a codegen step;
/// in a real app this file is generated and `no_raw_text` skips it either way,
/// because the rule exempts everything under lib/src/l10n/.
class AppL10n {
  const AppL10n();

  String get orderSummary => 'Order summary';
  String get discountCode => 'Discount code';
  String get removeItem => 'Remove item';
  String totalDue(String amount) => 'Total: $amount';
}

extension AppL10nX on BuildContext {
  AppL10n get l10n => const AppL10n();
}
