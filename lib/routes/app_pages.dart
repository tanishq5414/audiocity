import 'package:get/get.dart';
import 'package:psventuresassignment/features/list_audio/list_recordings_bindings.dart';
import 'package:psventuresassignment/features/list_audio/list_recordings_page.dart';
import 'package:psventuresassignment/features/record_audio/record_audio_binding.dart';
import 'package:psventuresassignment/features/record_audio/record_audio_page.dart';
import 'package:psventuresassignment/features/settings/settings_bindings.dart';
import 'package:psventuresassignment/features/settings/settings_page.dart';
import 'package:psventuresassignment/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      title: AppRoutes.recordAudio.name,
      name: AppRoutes.recordAudio.route,
      page: () => const RecordAudioPage(),
      binding: RecordAudioBinding(),
    ),
    GetPage(
        title: AppRoutes.listRecordings.name,
        name: AppRoutes.listRecordings.route,
        page: () => const ListRecordingsPage(),
        binding: ListRecordingsBindings()),
    GetPage(
        title: AppRoutes.settings.name,
        name: AppRoutes.settings.route,
        page: () => const SettingsPage(),
        binding: SettingsBindings()),
  ];
}
