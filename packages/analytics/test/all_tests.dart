// GENERATED — do not edit by hand.
// Single-isolate test wrapper for analytics
// Run: flutter test test/all_tests.dart

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cubits/dashboard_cubit_test.dart' as test_0;
import 'cubits/events_cubit_test.dart' as test_1;
import 'cubits/funnel_cubit_test.dart' as test_2;
import 'cubits/real_time_cubit_test.dart' as test_3;
import 'cubits/report_cubit_test.dart' as test_4;
import 'cubits/segment_cubit_test.dart' as test_5;
import 'everything_test.dart' as test_6;
import 'integration_test.dart' as test_7;
import 'models/analytics_data_entity_0_dup_1_test.dart' as test_8;
import 'models/analytics_data_entity_0_dup_2_test.dart' as test_9;
import 'models/analytics_data_entity_0_test.dart' as test_10;
import 'models/analytics_data_entity_1_dup_1_test.dart' as test_11;
import 'models/analytics_data_entity_1_dup_2_test.dart' as test_12;
import 'models/analytics_data_entity_1_test.dart' as test_13;
import 'models/analytics_data_entity_2_dup_1_test.dart' as test_14;
import 'models/analytics_data_entity_2_dup_2_test.dart' as test_15;
import 'models/analytics_data_entity_2_test.dart' as test_16;
import 'models/analytics_data_entity_3_dup_1_test.dart' as test_17;
import 'models/analytics_data_entity_3_dup_2_test.dart' as test_18;
import 'models/analytics_data_entity_3_test.dart' as test_19;
import 'models/analytics_data_entity_4_dup_1_test.dart' as test_20;
import 'models/analytics_data_entity_4_dup_2_test.dart' as test_21;
import 'models/analytics_data_entity_4_test.dart' as test_22;
import 'models/analytics_data_entity_5_dup_1_test.dart' as test_23;
import 'models/analytics_data_entity_5_dup_2_test.dart' as test_24;
import 'models/analytics_data_entity_5_test.dart' as test_25;
import 'models/analytics_data_entity_6_dup_1_test.dart' as test_26;
import 'models/analytics_data_entity_6_dup_2_test.dart' as test_27;
import 'models/analytics_data_entity_6_test.dart' as test_28;
import 'models/analytics_data_entity_7_dup_1_test.dart' as test_29;
import 'models/analytics_data_entity_7_dup_2_test.dart' as test_30;
import 'models/analytics_data_entity_7_test.dart' as test_31;
import 'models/cohort_model_test.dart' as test_32;
import 'models/conversion_model_test.dart' as test_33;
import 'models/dimension_model_test.dart' as test_34;
import 'models/event_model_test.dart' as test_35;
import 'models/funnel_model_test.dart' as test_36;
import 'models/goal_model_test.dart' as test_37;
import 'models/metric_model_test.dart' as test_38;
import 'models/report_model_test.dart' as test_39;
import 'models/segment_model_test.dart' as test_40;
import 'models/session_data_model_test.dart' as test_41;
import 'repositories/event_repository_test.dart' as test_42;
import 'repositories/funnel_repository_test.dart' as test_43;
import 'repositories/metrics_repository_test.dart' as test_44;
import 'repositories/report_repository_test.dart' as test_45;
import 'repositories/segment_repository_test.dart' as test_46;
import 'services/event_tracker_test.dart' as test_47;
import 'services/export_service_test.dart' as test_48;
import 'services/funnel_service_test.dart' as test_49;
import 'services/metrics_service_test.dart' as test_50;
import 'services/report_service_test.dart' as test_51;
import 'services/segment_service_test.dart' as test_52;
import 'utils/analytics_utils_0_test.dart' as test_53;
import 'utils/analytics_utils_1_test.dart' as test_54;
import 'utils/analytics_utils_2_test.dart' as test_55;
import 'utils/analytics_utils_3_test.dart' as test_56;
import 'utils/analytics_utils_4_test.dart' as test_57;
import 'utils/analytics_utils_5_test.dart' as test_58;
import 'widgets/analytics_dashboard_test.dart' as test_59;
import 'widgets/analytics_screen_0_dup_1_test.dart' as test_60;
import 'widgets/analytics_screen_0_dup_2_test.dart' as test_61;
import 'widgets/analytics_screen_0_test.dart' as test_62;
import 'widgets/analytics_screen_1_dup_1_test.dart' as test_63;
import 'widgets/analytics_screen_1_dup_2_test.dart' as test_64;
import 'widgets/analytics_screen_1_test.dart' as test_65;
import 'widgets/analytics_screen_2_dup_1_test.dart' as test_66;
import 'widgets/analytics_screen_2_dup_2_test.dart' as test_67;
import 'widgets/analytics_screen_2_test.dart' as test_68;
import 'widgets/analytics_screen_3_dup_1_test.dart' as test_69;
import 'widgets/analytics_screen_3_dup_2_test.dart' as test_70;
import 'widgets/analytics_screen_3_test.dart' as test_71;
import 'widgets/analytics_screen_4_dup_1_test.dart' as test_72;
import 'widgets/analytics_screen_4_dup_2_test.dart' as test_73;
import 'widgets/analytics_screen_4_test.dart' as test_74;
import 'widgets/conversion_funnel_test.dart' as test_75;
import 'widgets/date_range_picker_test.dart' as test_76;
import 'widgets/event_list_test.dart' as test_77;
import 'widgets/export_button_test.dart' as test_78;
import 'widgets/filter_panel_test.dart' as test_79;
import 'widgets/kpi_card_test.dart' as test_80;
import 'widgets/metric_chart_test.dart' as test_81;
import 'widgets/report_viewer_test.dart' as test_82;
import 'widgets/segment_picker_test.dart' as test_83;
import 'widgets/trend_line_test.dart' as test_84;

void main() {
  void resetTestEnvironment() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Reset screen size
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.clearAllTestValues();
  }

  group('cubits/dashboard_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_0.main();
  });

  group('cubits/events_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_1.main();
  });

  group('cubits/funnel_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_2.main();
  });

  group('cubits/real_time_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_3.main();
  });

  group('cubits/report_cubit_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_4.main();
  });

  group('cubits/segment_cubit_test.dart', () {
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

  group('models/analytics_data_entity_0_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_8.main();
  });

  group('models/analytics_data_entity_0_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_9.main();
  });

  group('models/analytics_data_entity_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_10.main();
  });

  group('models/analytics_data_entity_1_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_11.main();
  });

  group('models/analytics_data_entity_1_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_12.main();
  });

  group('models/analytics_data_entity_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_13.main();
  });

  group('models/analytics_data_entity_2_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_14.main();
  });

  group('models/analytics_data_entity_2_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_15.main();
  });

  group('models/analytics_data_entity_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_16.main();
  });

  group('models/analytics_data_entity_3_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_17.main();
  });

  group('models/analytics_data_entity_3_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_18.main();
  });

  group('models/analytics_data_entity_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_19.main();
  });

  group('models/analytics_data_entity_4_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_20.main();
  });

  group('models/analytics_data_entity_4_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_21.main();
  });

  group('models/analytics_data_entity_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_22.main();
  });

  group('models/analytics_data_entity_5_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_23.main();
  });

  group('models/analytics_data_entity_5_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_24.main();
  });

  group('models/analytics_data_entity_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_25.main();
  });

  group('models/analytics_data_entity_6_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_26.main();
  });

  group('models/analytics_data_entity_6_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_27.main();
  });

  group('models/analytics_data_entity_6_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_28.main();
  });

  group('models/analytics_data_entity_7_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_29.main();
  });

  group('models/analytics_data_entity_7_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_30.main();
  });

  group('models/analytics_data_entity_7_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_31.main();
  });

  group('models/cohort_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_32.main();
  });

  group('models/conversion_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_33.main();
  });

  group('models/dimension_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_34.main();
  });

  group('models/event_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_35.main();
  });

  group('models/funnel_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_36.main();
  });

  group('models/goal_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_37.main();
  });

  group('models/metric_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_38.main();
  });

  group('models/report_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_39.main();
  });

  group('models/segment_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_40.main();
  });

  group('models/session_data_model_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_41.main();
  });

  group('repositories/event_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_42.main();
  });

  group('repositories/funnel_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_43.main();
  });

  group('repositories/metrics_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_44.main();
  });

  group('repositories/report_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_45.main();
  });

  group('repositories/segment_repository_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_46.main();
  });

  group('services/event_tracker_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_47.main();
  });

  group('services/export_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_48.main();
  });

  group('services/funnel_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_49.main();
  });

  group('services/metrics_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_50.main();
  });

  group('services/report_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_51.main();
  });

  group('services/segment_service_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_52.main();
  });

  group('utils/analytics_utils_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_53.main();
  });

  group('utils/analytics_utils_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_54.main();
  });

  group('utils/analytics_utils_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_55.main();
  });

  group('utils/analytics_utils_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_56.main();
  });

  group('utils/analytics_utils_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_57.main();
  });

  group('utils/analytics_utils_5_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_58.main();
  });

  group('widgets/analytics_dashboard_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_59.main();
  });

  group('widgets/analytics_screen_0_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_60.main();
  });

  group('widgets/analytics_screen_0_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_61.main();
  });

  group('widgets/analytics_screen_0_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_62.main();
  });

  group('widgets/analytics_screen_1_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_63.main();
  });

  group('widgets/analytics_screen_1_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_64.main();
  });

  group('widgets/analytics_screen_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_65.main();
  });

  group('widgets/analytics_screen_2_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_66.main();
  });

  group('widgets/analytics_screen_2_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_67.main();
  });

  group('widgets/analytics_screen_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_68.main();
  });

  group('widgets/analytics_screen_3_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_69.main();
  });

  group('widgets/analytics_screen_3_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_70.main();
  });

  group('widgets/analytics_screen_3_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_71.main();
  });

  group('widgets/analytics_screen_4_dup_1_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_72.main();
  });

  group('widgets/analytics_screen_4_dup_2_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_73.main();
  });

  group('widgets/analytics_screen_4_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_74.main();
  });

  group('widgets/conversion_funnel_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_75.main();
  });

  group('widgets/date_range_picker_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_76.main();
  });

  group('widgets/event_list_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_77.main();
  });

  group('widgets/export_button_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_78.main();
  });

  group('widgets/filter_panel_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_79.main();
  });

  group('widgets/kpi_card_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_80.main();
  });

  group('widgets/metric_chart_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_81.main();
  });

  group('widgets/report_viewer_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_82.main();
  });

  group('widgets/segment_picker_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_83.main();
  });

  group('widgets/trend_line_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_84.main();
  });

}
