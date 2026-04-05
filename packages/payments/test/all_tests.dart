// GENERATED — do not edit by hand.
// Single-isolate test wrapper for payments
// Run: flutter test test/all_tests.dart

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cubits/account_cubit_test.dart' as test_0;
import 'cubits/card_cubit_test.dart' as test_1;
import 'cubits/checkout_cubit_test.dart' as test_2;
import 'cubits/invoice_cubit_test.dart' as test_3;
import 'cubits/payment_cubit_test.dart' as test_4;
import 'cubits/refund_cubit_test.dart' as test_5;
import 'cubits/subscription_cubit_test.dart' as test_6;
import 'everything_test.dart' as test_7;
import 'integration_test.dart' as test_8;
import 'models/account_model_test.dart' as test_9;
import 'models/bank_account_model_test.dart' as test_10;
import 'models/card_model_test.dart' as test_11;
import 'models/discount_model_test.dart' as test_12;
import 'models/invoice_model_test.dart' as test_13;
import 'models/payment_model_test.dart' as test_14;
import 'models/payments_data_entity_0_test.dart' as test_15;
import 'models/payments_data_entity_1_test.dart' as test_16;
import 'models/payments_data_entity_2_test.dart' as test_17;
import 'models/payments_data_entity_3_test.dart' as test_18;
import 'models/payments_data_entity_4_test.dart' as test_19;
import 'models/payments_data_entity_5_test.dart' as test_20;
import 'models/payments_data_entity_6_test.dart' as test_21;
import 'models/payments_data_entity_7_test.dart' as test_22;
import 'models/receipt_model_test.dart' as test_23;
import 'models/refund_model_test.dart' as test_24;
import 'models/subscription_model_test.dart' as test_25;
import 'models/tax_model_test.dart' as test_26;
import 'models/transaction_model_test.dart' as test_27;
import 'models/wallet_model_test.dart' as test_28;
import 'repositories/account_repository_test.dart' as test_29;
import 'repositories/card_repository_test.dart' as test_30;
import 'repositories/invoice_repository_test.dart' as test_31;
import 'repositories/payment_repository_test.dart' as test_32;
import 'repositories/subscription_repository_test.dart' as test_33;
import 'repositories/wallet_repository_test.dart' as test_34;
import 'services/card_service_test.dart' as test_35;
import 'services/invoice_service_test.dart' as test_36;
import 'services/payment_service_test.dart' as test_37;
import 'services/refund_service_test.dart' as test_38;
import 'services/subscription_service_test.dart' as test_39;
import 'services/transaction_service_test.dart' as test_40;
import 'services/wallet_service_test.dart' as test_41;
import 'utils/payments_utils_0_test.dart' as test_42;
import 'utils/payments_utils_1_test.dart' as test_43;
import 'utils/payments_utils_2_test.dart' as test_44;
import 'utils/payments_utils_3_test.dart' as test_45;
import 'utils/payments_utils_4_test.dart' as test_46;
import 'utils/payments_utils_5_test.dart' as test_47;
import 'widgets/account_summary_test.dart' as test_48;
import 'widgets/card_selector_test.dart' as test_49;
import 'widgets/checkout_page_test.dart' as test_50;
import 'widgets/invoice_card_test.dart' as test_51;
import 'widgets/payment_form_test.dart' as test_52;
import 'widgets/payment_history_test.dart' as test_53;
import 'widgets/payments_screen_0_test.dart' as test_54;
import 'widgets/payments_screen_1_test.dart' as test_55;
import 'widgets/payments_screen_2_test.dart' as test_56;
import 'widgets/payments_screen_3_test.dart' as test_57;
import 'widgets/payments_screen_4_test.dart' as test_58;
import 'widgets/receipt_view_test.dart' as test_59;
import 'widgets/refund_dialog_test.dart' as test_60;
import 'widgets/subscription_card_test.dart' as test_61;
import 'widgets/transaction_list_test.dart' as test_62;
import 'widgets/wallet_balance_test.dart' as test_63;

void main() {
  void resetTestEnvironment() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Reset screen size
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.clearAllTestValues();
  }

  group('cubits/account_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_0.main();
  });

  group('cubits/card_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_1.main();
  });

  group('cubits/checkout_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_2.main();
  });

  group('cubits/invoice_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_3.main();
  });

  group('cubits/payment_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_4.main();
  });

  group('cubits/refund_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_5.main();
  });

  group('cubits/subscription_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_6.main();
  });

  group('everything_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_7.main();
  });

  group('integration_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_8.main();
  });

  group('models/account_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_9.main();
  });

  group('models/bank_account_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_10.main();
  });

  group('models/card_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_11.main();
  });

  group('models/discount_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_12.main();
  });

  group('models/invoice_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_13.main();
  });

  group('models/payment_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_14.main();
  });

  group('models/payments_data_entity_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_15.main();
  });

  group('models/payments_data_entity_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_16.main();
  });

  group('models/payments_data_entity_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_17.main();
  });

  group('models/payments_data_entity_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_18.main();
  });

  group('models/payments_data_entity_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_19.main();
  });

  group('models/payments_data_entity_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_20.main();
  });

  group('models/payments_data_entity_6_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_21.main();
  });

  group('models/payments_data_entity_7_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_22.main();
  });

  group('models/receipt_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_23.main();
  });

  group('models/refund_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_24.main();
  });

  group('models/subscription_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_25.main();
  });

  group('models/tax_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_26.main();
  });

  group('models/transaction_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_27.main();
  });

  group('models/wallet_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_28.main();
  });

  group('repositories/account_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_29.main();
  });

  group('repositories/card_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_30.main();
  });

  group('repositories/invoice_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_31.main();
  });

  group('repositories/payment_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_32.main();
  });

  group('repositories/subscription_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_33.main();
  });

  group('repositories/wallet_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_34.main();
  });

  group('services/card_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_35.main();
  });

  group('services/invoice_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_36.main();
  });

  group('services/payment_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_37.main();
  });

  group('services/refund_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_38.main();
  });

  group('services/subscription_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_39.main();
  });

  group('services/transaction_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_40.main();
  });

  group('services/wallet_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_41.main();
  });

  group('utils/payments_utils_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_42.main();
  });

  group('utils/payments_utils_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_43.main();
  });

  group('utils/payments_utils_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_44.main();
  });

  group('utils/payments_utils_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_45.main();
  });

  group('utils/payments_utils_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_46.main();
  });

  group('utils/payments_utils_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_47.main();
  });

  group('widgets/account_summary_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_48.main();
  });

  group('widgets/card_selector_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_49.main();
  });

  group('widgets/checkout_page_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_50.main();
  });

  group('widgets/invoice_card_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_51.main();
  });

  group('widgets/payment_form_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_52.main();
  });

  group('widgets/payment_history_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_53.main();
  });

  group('widgets/payments_screen_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_54.main();
  });

  group('widgets/payments_screen_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_55.main();
  });

  group('widgets/payments_screen_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_56.main();
  });

  group('widgets/payments_screen_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_57.main();
  });

  group('widgets/payments_screen_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_58.main();
  });

  group('widgets/receipt_view_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_59.main();
  });

  group('widgets/refund_dialog_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_60.main();
  });

  group('widgets/subscription_card_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_61.main();
  });

  group('widgets/transaction_list_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_62.main();
  });

  group('widgets/wallet_balance_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_63.main();
  });

}
