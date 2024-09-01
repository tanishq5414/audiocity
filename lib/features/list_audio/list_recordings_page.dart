import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/features/list_audio/list_recordings_controller.dart';

class ListRecordingsPage extends StatelessWidget {
  const ListRecordingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ListRecordingsController>(
          init: ListRecordingsController(),
          builder: (ListRecordingsController controller) {
            return controller.recordings.isEmpty
                ? const Center(
                    child: Text('No recordings found'),
                  )
                : Center(
                    child: ListView.builder(
                      itemCount: controller.recordings.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.recordings[index].path
                              .split('/')
                              .last),
                          trailing: IconButton(
                            onPressed: () {
                              controller.shareRecording(
                                  controller.recordings[index].path);
                            },
                            icon: const Icon(Icons.play_arrow),
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
