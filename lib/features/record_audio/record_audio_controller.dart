
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/common/snack_bar.dart';
import 'package:psventuresassignment/constants/interaction_messages.dart';
import 'package:psventuresassignment/core/repository/recorder_repository.dart';
import 'package:psventuresassignment/core/repository/storage_repository.dart';
import 'package:psventuresassignment/features/record_audio/widgets/filename_input.dart';

class RecordAudioController extends GetxController{
  RecorderRepository recorderRepository = RecorderRepository();
  StorageRepository storageRepository = StorageRepository();
  
  bool isRecording = false;
  bool isRecordingPaused = false;

   get onCurrentDurationChanged => recorderRepository.recorderController.onCurrentDuration;

  void startRecording(context) async{
    final bool hasRecordingPermission = await recorderRepository.checkRecordingPermission();
    isRecordingPaused = false;
    if (!hasRecordingPermission) {
      showCommonSnackBar(context, InteractionMessages.microphonePermissionRequired);
      return;
    }
    final bool hasStoragePermission = await storageRepository.checkPermission();
    if (!hasStoragePermission) {
      showCommonSnackBar(context, InteractionMessages.storagePermissionRequired);
      return;
    }
    recorderRepository.startRecording();
    isRecording = true;
    update();
  }

  void pauseRecording() {
    isRecordingPaused = true;
    recorderRepository.pauseRecording();
    update();
  }

  void resumeRecording() {
    isRecordingPaused = false;
    recorderRepository.resumeRecording();
    update();
  }

  void saveRecording(context) async{
    isRecording = false;
    String path = await recorderRepository.saveRecording();
    bool askForFileNames = await storageRepository.checkFileNames();
    if(askForFileNames){
      fileNameInputDialog(context, (value)async {
        var fileName = value;
        await _saveRecording(path, context , fileName: fileName);
      });
    }else{
      await _saveRecording(path, context);
    }
    update();
  }

  Future<void> _saveRecording(String path, context, {String? fileName}) async {
    if(path.isEmpty){
      showCommonSnackBar(context, InteractionMessages.recordingSaveFailed);
    }

    final savedPath = await storageRepository.saveFile(path, fileName);
    if(savedPath == null){
      showCommonSnackBar(context, InteractionMessages.recordingSaveFailed);
    }
    showCommonSnackBar(context, "${InteractionMessages.recordingSaved} $savedPath");
  }

  void cancelRecording() {
    recorderRepository.cancelRecording();
  }
}