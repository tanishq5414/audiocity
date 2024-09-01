import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/common/snackbar.dart';
import 'package:psventuresassignment/constants/interaction_messages.dart';
import 'package:psventuresassignment/core/repository/recorder_repository.dart';
import 'package:psventuresassignment/core/repository/storage_repository.dart';

class RecordAudioController extends GetxController{
  RecorderRepository recorderRepository = RecorderRepository();
  StorageRepository storageRepository = StorageRepository();
  
  bool isRecording = false;

   get onCurrentDurationChanged => recorderRepository.recorderController.onCurrentDuration;

  void startRecording(context) async{
    final bool hasRecordingPermission = await recorderRepository.checkRecordingPermission();
    if (!hasRecordingPermission) {
      showSnackBar(context, InteractionMessages.microphonePermissionRequired);
      return;
    }
    final bool hasStoragePermission = await storageRepository.checkPermission();
    if (!hasStoragePermission) {
      showSnackBar(context, InteractionMessages.storagePermissionRequired);
      return;
    }
    recorderRepository.startRecording();
    isRecording = true;
    update();
  }

  void pauseRecording() {
    recorderRepository.pauseRecording();
  }

  void resumeRecording() {
    recorderRepository.resumeRecording();
  }

  void saveRecording(context) async{
    isRecording = false;
    String path = await recorderRepository.saveRecording();
    if(path.isEmpty){
      showSnackBar(context, InteractionMessages.recordingSaveFailed);
    }
    final savedPath = await storageRepository.saveFile(path);
    if(savedPath == null){
      showSnackBar(context, InteractionMessages.recordingSaveFailed);
    }
    showSnackBar(context, "${InteractionMessages.recordingSaved} $savedPath");
    update();
  }

  void cancelRecording() {
    recorderRepository.cancelRecording();
  }
}