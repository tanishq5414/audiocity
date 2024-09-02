import 'dart:io';

import 'package:get/get.dart';
import 'package:psventuresassignment/core/repository/player_repository.dart';
import 'package:psventuresassignment/core/repository/storage_repository.dart';
import 'package:psventuresassignment/models/recording_model.dart';
import 'package:share_plus/share_plus.dart';

class ListRecordingsController extends GetxController {
  StorageRepository storageRepository = StorageRepository();
  PlayerRepository playerRepository = PlayerRepository();
  List<RecordingModel> recordings = [];
  bool isPlaying = false;
  XFile? currentAudio;
  dynamic waveFormData;

  @override
  void onInit() {
    getRecordings();
    super.onInit();
  }

  void getRecordings() async {
    recordings = await storageRepository.getAllFiles()??[];
    update();
  }

  void playRecording(String path)async {
    isPlaying = true;
    // if(currentAudio!=null){
    //   stopPlaying();
    // }
    currentAudio = await storageRepository.getFile(path);
    waveFormData = await playerRepository.getWaveformData(path);
    await playerRepository.startPlaying(path);
    update();
  }

  void shareRecording(String path) async{
    XFile file = await storageRepository.getFile(path)??XFile('');
    Share.shareXFiles([file]);
  }

  void stopPlaying() {
    isPlaying = false;
    currentAudio = null;
    playerRepository.stopPlaying();
    update();
  }
}
