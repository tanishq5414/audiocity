import 'dart:io';

import 'package:get/get.dart';
import 'package:psventuresassignment/core/repository/storage_repository.dart';
import 'package:share_plus/share_plus.dart';

class ListRecordingsController extends GetxController {
  StorageRepository storageRepository = StorageRepository();
  List<FileSystemEntity> recordings = [];

  @override
  void onInit() {
    getRecordings();
    super.onInit();
  }

  void getRecordings() async {
    recordings = await storageRepository.getAllFiles()??[];
    update();
  }

  void playRecording(String path) {
    // play the recording
  }

  void deleteRecording(String path) {
    // delete the recording
  }

  void shareRecording(String path) async{
    XFile file = await storageRepository.getFile(path)??XFile('');
    Share.shareXFiles([file]);
  }
}
