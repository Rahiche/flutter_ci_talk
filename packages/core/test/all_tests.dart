// GENERATED — do not edit by hand.
// Single-isolate test wrapper for core
// Run: flutter test test/all_tests.dart

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cubits/connectivity_cubit_test.dart' as test_0;
import 'cubits/locale_cubit_test.dart' as test_1;
import 'cubits/navigation_cubit_test.dart' as test_2;
import 'cubits/permission_cubit_test.dart' as test_3;
import 'cubits/theme_cubit_test.dart' as test_4;
import 'cubits/version_cubit_test.dart' as test_5;
import 'everything_test.dart' as test_6;
import 'integration_test.dart' as test_7;
import 'models/api_response_test.dart' as test_8;
import 'models/app_config_test.dart' as test_9;
import 'models/cache_entry_test.dart' as test_10;
import 'models/core_data_entity_0_test.dart' as test_11;
import 'models/core_data_entity_1_test.dart' as test_12;
import 'models/core_data_entity_2_test.dart' as test_13;
import 'models/core_data_entity_3_test.dart' as test_14;
import 'models/core_data_entity_4_test.dart' as test_15;
import 'models/core_data_entity_5_test.dart' as test_16;
import 'models/core_data_entity_6_test.dart' as test_17;
import 'models/core_data_entity_7_test.dart' as test_18;
import 'models/error_model_test.dart' as test_19;
import 'models/feature_flag_test.dart' as test_20;
import 'models/locale_model_test.dart' as test_21;
import 'models/log_entry_test.dart' as test_22;
import 'models/pagination_model_test.dart' as test_23;
import 'models/route_config_test.dart' as test_24;
import 'models/theme_config_test.dart' as test_25;
import 'repositories/cache_repository_test.dart' as test_26;
import 'repositories/config_repository_test.dart' as test_27;
import 'repositories/feature_flag_repository_test.dart' as test_28;
import 'repositories/log_repository_test.dart' as test_29;
import 'repositories/theme_repository_test.dart' as test_30;
import 'services/cache_service_test.dart' as test_31;
import 'services/connectivity_service_test.dart' as test_32;
import 'services/encryption_service_test.dart' as test_33;
import 'services/http_client_test.dart' as test_34;
import 'services/logger_service_test.dart' as test_35;
import 'services/storage_service_test.dart' as test_36;
import 'utils/core_utils_0_test.dart' as test_37;
import 'utils/core_utils_1_test.dart' as test_38;
import 'utils/core_utils_2_test.dart' as test_39;
import 'utils/core_utils_3_test.dart' as test_40;
import 'utils/core_utils_4_test.dart' as test_41;
import 'utils/core_utils_5_test.dart' as test_42;
import 'widgets/app_search_field_test.dart' as test_43;
import 'widgets/badge_icon_test.dart' as test_44;
import 'widgets/bottom_nav_bar_test.dart' as test_45;
import 'widgets/confirm_dialog_test.dart' as test_46;
import 'widgets/core_screen_0_test.dart' as test_47;
import 'widgets/core_screen_1_test.dart' as test_48;
import 'widgets/core_screen_2_test.dart' as test_49;
import 'widgets/core_screen_3_test.dart' as test_50;
import 'widgets/core_screen_4_test.dart' as test_51;
import 'widgets/custom_app_bar_test.dart' as test_52;
import 'widgets/empty_state_test.dart' as test_53;
import 'widgets/error_display_test.dart' as test_54;
import 'widgets/info_card_test.dart' as test_55;
import 'widgets/loading_indicator_test.dart' as test_56;
import 'widgets/progress_bar_test.dart' as test_57;

void main() {
  void resetTestEnvironment() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Reset screen size
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.clearAllTestValues();
  }

  group('cubits/connectivity_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_0.main();
  });

  group('cubits/locale_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_1.main();
  });

  group('cubits/navigation_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_2.main();
  });

  group('cubits/permission_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_3.main();
  });

  group('cubits/theme_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_4.main();
  });

  group('cubits/version_cubit_test.dart', () {
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

  group('models/api_response_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_8.main();
  });

  group('models/app_config_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_9.main();
  });

  group('models/cache_entry_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_10.main();
  });

  group('models/core_data_entity_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_11.main();
  });

  group('models/core_data_entity_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_12.main();
  });

  group('models/core_data_entity_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_13.main();
  });

  group('models/core_data_entity_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_14.main();
  });

  group('models/core_data_entity_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_15.main();
  });

  group('models/core_data_entity_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_16.main();
  });

  group('models/core_data_entity_6_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_17.main();
  });

  group('models/core_data_entity_7_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_18.main();
  });

  group('models/error_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_19.main();
  });

  group('models/feature_flag_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_20.main();
  });

  group('models/locale_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_21.main();
  });

  group('models/log_entry_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_22.main();
  });

  group('models/pagination_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_23.main();
  });

  group('models/route_config_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_24.main();
  });

  group('models/theme_config_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_25.main();
  });

  group('repositories/cache_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_26.main();
  });

  group('repositories/config_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_27.main();
  });

  group('repositories/feature_flag_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_28.main();
  });

  group('repositories/log_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_29.main();
  });

  group('repositories/theme_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_30.main();
  });

  group('services/cache_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_31.main();
  });

  group('services/connectivity_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_32.main();
  });

  group('services/encryption_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_33.main();
  });

  group('services/http_client_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_34.main();
  });

  group('services/logger_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_35.main();
  });

  group('services/storage_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_36.main();
  });

  group('utils/core_utils_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_37.main();
  });

  group('utils/core_utils_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_38.main();
  });

  group('utils/core_utils_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_39.main();
  });

  group('utils/core_utils_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_40.main();
  });

  group('utils/core_utils_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_41.main();
  });

  group('utils/core_utils_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_42.main();
  });

  group('widgets/app_search_field_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_43.main();
  });

  group('widgets/badge_icon_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_44.main();
  });

  group('widgets/bottom_nav_bar_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_45.main();
  });

  group('widgets/confirm_dialog_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_46.main();
  });

  group('widgets/core_screen_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_47.main();
  });

  group('widgets/core_screen_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_48.main();
  });

  group('widgets/core_screen_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_49.main();
  });

  group('widgets/core_screen_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_50.main();
  });

  group('widgets/core_screen_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_51.main();
  });

  group('widgets/custom_app_bar_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_52.main();
  });

  group('widgets/empty_state_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_53.main();
  });

  group('widgets/error_display_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_54.main();
  });

  group('widgets/info_card_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_55.main();
  });

  group('widgets/loading_indicator_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_56.main();
  });

  group('widgets/progress_bar_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_57.main();
  });

}
