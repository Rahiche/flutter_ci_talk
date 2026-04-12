// GENERATED — do not edit by hand.
// Single-isolate test wrapper for app
// Run: flutter test test/all_tests.dart

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cubits/auth_cubit_test.dart' as test_0;
import 'cubits/notification_cubit_test.dart' as test_1;
import 'cubits/onboarding_cubit_test.dart' as test_2;
import 'cubits/profile_cubit_test.dart' as test_3;
import 'cubits/session_cubit_test.dart' as test_4;
import 'cubits/settings_cubit_test.dart' as test_5;
import 'everything_test.dart' as test_6;
import 'integration_test.dart' as test_7;
import 'models/address_model_test.dart' as test_8;
import 'models/app_data_entity_0_dup_1_test.dart' as test_9;
import 'models/app_data_entity_0_dup_2_test.dart' as test_10;
import 'models/app_data_entity_0_test.dart' as test_11;
import 'models/app_data_entity_1_dup_1_test.dart' as test_12;
import 'models/app_data_entity_1_dup_2_test.dart' as test_13;
import 'models/app_data_entity_1_test.dart' as test_14;
import 'models/app_data_entity_2_dup_1_test.dart' as test_15;
import 'models/app_data_entity_2_dup_2_test.dart' as test_16;
import 'models/app_data_entity_2_test.dart' as test_17;
import 'models/app_data_entity_3_dup_1_test.dart' as test_18;
import 'models/app_data_entity_3_dup_2_test.dart' as test_19;
import 'models/app_data_entity_3_test.dart' as test_20;
import 'models/app_data_entity_4_dup_1_test.dart' as test_21;
import 'models/app_data_entity_4_dup_2_test.dart' as test_22;
import 'models/app_data_entity_4_test.dart' as test_23;
import 'models/app_data_entity_5_dup_1_test.dart' as test_24;
import 'models/app_data_entity_5_dup_2_test.dart' as test_25;
import 'models/app_data_entity_5_test.dart' as test_26;
import 'models/app_data_entity_6_dup_1_test.dart' as test_27;
import 'models/app_data_entity_6_dup_2_test.dart' as test_28;
import 'models/app_data_entity_6_test.dart' as test_29;
import 'models/app_data_entity_7_dup_1_test.dart' as test_30;
import 'models/app_data_entity_7_dup_2_test.dart' as test_31;
import 'models/app_data_entity_7_test.dart' as test_32;
import 'models/audit_log_model_test.dart' as test_33;
import 'models/device_model_test.dart' as test_34;
import 'models/notification_model_test.dart' as test_35;
import 'models/preference_model_test.dart' as test_36;
import 'models/profile_model_test.dart' as test_37;
import 'models/session_model_test.dart' as test_38;
import 'models/settings_model_test.dart' as test_39;
import 'models/token_model_test.dart' as test_40;
import 'models/user_model_test.dart' as test_41;
import 'repositories/auth_repository_test.dart' as test_42;
import 'repositories/notification_repository_test.dart' as test_43;
import 'repositories/preference_repository_test.dart' as test_44;
import 'repositories/session_repository_test.dart' as test_45;
import 'repositories/user_repository_test.dart' as test_46;
import 'services/auth_service_test.dart' as test_47;
import 'services/device_service_test.dart' as test_48;
import 'services/notification_service_test.dart' as test_49;
import 'services/preference_service_test.dart' as test_50;
import 'services/session_service_test.dart' as test_51;
import 'services/user_service_test.dart' as test_52;
import 'utils/app_utils_0_test.dart' as test_53;
import 'utils/app_utils_1_test.dart' as test_54;
import 'utils/app_utils_2_test.dart' as test_55;
import 'utils/app_utils_3_test.dart' as test_56;
import 'utils/app_utils_4_test.dart' as test_57;
import 'utils/app_utils_5_test.dart' as test_58;
import 'widgets/app_drawer_test.dart' as test_59;
import 'widgets/app_screen_0_dup_1_test.dart' as test_60;
import 'widgets/app_screen_0_dup_2_test.dart' as test_61;
import 'widgets/app_screen_0_test.dart' as test_62;
import 'widgets/app_screen_1_dup_1_test.dart' as test_63;
import 'widgets/app_screen_1_dup_2_test.dart' as test_64;
import 'widgets/app_screen_1_test.dart' as test_65;
import 'widgets/app_screen_2_dup_1_test.dart' as test_66;
import 'widgets/app_screen_2_dup_2_test.dart' as test_67;
import 'widgets/app_screen_2_test.dart' as test_68;
import 'widgets/app_screen_3_dup_1_test.dart' as test_69;
import 'widgets/app_screen_3_dup_2_test.dart' as test_70;
import 'widgets/app_screen_3_test.dart' as test_71;
import 'widgets/app_screen_4_dup_1_test.dart' as test_72;
import 'widgets/app_screen_4_dup_2_test.dart' as test_73;
import 'widgets/app_screen_4_test.dart' as test_74;
import 'widgets/dashboard_header_test.dart' as test_75;
import 'widgets/login_form_test.dart' as test_76;
import 'widgets/notification_list_test.dart' as test_77;
import 'widgets/onboarding_page_test.dart' as test_78;
import 'widgets/profile_card_test.dart' as test_79;
import 'widgets/settings_page_test.dart' as test_80;
import 'widgets/splash_screen_test.dart' as test_81;
import 'widgets/user_avatar_test.dart' as test_82;
import 'widgets/welcome_banner_test.dart' as test_83;

void main() {
  void resetTestEnvironment() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Reset screen size
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.clearAllTestValues();
  }

  group('cubits/auth_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_0.main();
  });

  group('cubits/notification_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_1.main();
  });

  group('cubits/onboarding_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_2.main();
  });

  group('cubits/profile_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_3.main();
  });

  group('cubits/session_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_4.main();
  });

  group('cubits/settings_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_5.main();
  });

  group('everything_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_6.main();
  });

  group('integration_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_7.main();
  });

  group('models/address_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_8.main();
  });

  group('models/app_data_entity_0_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_9.main();
  });

  group('models/app_data_entity_0_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_10.main();
  });

  group('models/app_data_entity_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_11.main();
  });

  group('models/app_data_entity_1_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_12.main();
  });

  group('models/app_data_entity_1_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_13.main();
  });

  group('models/app_data_entity_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_14.main();
  });

  group('models/app_data_entity_2_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_15.main();
  });

  group('models/app_data_entity_2_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_16.main();
  });

  group('models/app_data_entity_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_17.main();
  });

  group('models/app_data_entity_3_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_18.main();
  });

  group('models/app_data_entity_3_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_19.main();
  });

  group('models/app_data_entity_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_20.main();
  });

  group('models/app_data_entity_4_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_21.main();
  });

  group('models/app_data_entity_4_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_22.main();
  });

  group('models/app_data_entity_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_23.main();
  });

  group('models/app_data_entity_5_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_24.main();
  });

  group('models/app_data_entity_5_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_25.main();
  });

  group('models/app_data_entity_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_26.main();
  });

  group('models/app_data_entity_6_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_27.main();
  });

  group('models/app_data_entity_6_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_28.main();
  });

  group('models/app_data_entity_6_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_29.main();
  });

  group('models/app_data_entity_7_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_30.main();
  });

  group('models/app_data_entity_7_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_31.main();
  });

  group('models/app_data_entity_7_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_32.main();
  });

  group('models/audit_log_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_33.main();
  });

  group('models/device_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_34.main();
  });

  group('models/notification_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_35.main();
  });

  group('models/preference_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_36.main();
  });

  group('models/profile_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_37.main();
  });

  group('models/session_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_38.main();
  });

  group('models/settings_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_39.main();
  });

  group('models/token_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_40.main();
  });

  group('models/user_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_41.main();
  });

  group('repositories/auth_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_42.main();
  });

  group('repositories/notification_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_43.main();
  });

  group('repositories/preference_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_44.main();
  });

  group('repositories/session_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_45.main();
  });

  group('repositories/user_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_46.main();
  });

  group('services/auth_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_47.main();
  });

  group('services/device_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_48.main();
  });

  group('services/notification_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_49.main();
  });

  group('services/preference_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_50.main();
  });

  group('services/session_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_51.main();
  });

  group('services/user_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_52.main();
  });

  group('utils/app_utils_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_53.main();
  });

  group('utils/app_utils_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_54.main();
  });

  group('utils/app_utils_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_55.main();
  });

  group('utils/app_utils_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_56.main();
  });

  group('utils/app_utils_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_57.main();
  });

  group('utils/app_utils_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_58.main();
  });

  group('widgets/app_drawer_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_59.main();
  });

  group('widgets/app_screen_0_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_60.main();
  });

  group('widgets/app_screen_0_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_61.main();
  });

  group('widgets/app_screen_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_62.main();
  });

  group('widgets/app_screen_1_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_63.main();
  });

  group('widgets/app_screen_1_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_64.main();
  });

  group('widgets/app_screen_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_65.main();
  });

  group('widgets/app_screen_2_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_66.main();
  });

  group('widgets/app_screen_2_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_67.main();
  });

  group('widgets/app_screen_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_68.main();
  });

  group('widgets/app_screen_3_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_69.main();
  });

  group('widgets/app_screen_3_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_70.main();
  });

  group('widgets/app_screen_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_71.main();
  });

  group('widgets/app_screen_4_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_72.main();
  });

  group('widgets/app_screen_4_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_73.main();
  });

  group('widgets/app_screen_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_74.main();
  });

  group('widgets/dashboard_header_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_75.main();
  });

  group('widgets/login_form_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_76.main();
  });

  group('widgets/notification_list_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_77.main();
  });

  group('widgets/onboarding_page_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_78.main();
  });

  group('widgets/profile_card_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_79.main();
  });

  group('widgets/settings_page_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_80.main();
  });

  group('widgets/splash_screen_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_81.main();
  });

  group('widgets/user_avatar_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_82.main();
  });

  group('widgets/welcome_banner_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_83.main();
  });

}
