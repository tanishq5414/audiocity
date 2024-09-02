import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/common/tab_bar.dart';
import 'package:psventuresassignment/features/list_audio/list_recordings_page.dart';
import 'package:psventuresassignment/features/navigation/navigation_controller.dart';
import 'package:psventuresassignment/features/record_audio/record_audio_page.dart';
import 'package:psventuresassignment/features/settings/settings_page.dart';


class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: const CommonTabBar(),
          resizeToAvoidBottomInset: false,
          body: GetBuilder(
            init: NavigationController(),
            builder: (controller) {
              switch (controller.tabController.index) {
                case 0:
                  return const RecordAudioPage();
                case 1:
                  return const ListRecordingsPage();
                case 2:
                  return const SettingsPage();
                default:
                  return const RecordAudioPage();
              }
            },
          ),
        ),
      ),
    );
  }
}

