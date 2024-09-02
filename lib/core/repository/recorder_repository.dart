import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:psventuresassignment/core/repository/storage_repository.dart';

class IRecorderRepository {
  void checkRecordingPermission() {}
  void startRecording() {}
  void pauseRecording() {}
  void resumeRecording() {}
  void saveRecording() {}
  void cancelRecording() {}
}

class RecorderRepository implements IRecorderRepository {
  RecorderController recorderController = RecorderController();
  StorageRepository storageRepository = StorageRepository();


  @override
  Future<bool> checkRecordingPermission() async {
    final bool hasPermission = await recorderController.checkPermission();
    if (!hasPermission) {
      Permission.microphone.request();
    }
    return hasPermission;
  }
  @override
  void startRecording() async{
    recorderController.sampleRate = await storageRepository.getSamplingRate();
    recorderController.record();
  }

  @override
  void pauseRecording() {
    recorderController.pause();
  }

  @override
  void resumeRecording() {
    recorderController.record();
  }

  @override
  Future<String> saveRecording() async {
    String path = await recorderController.stop()??"";
    recorderController.elapsedDuration = Duration.zero;
    return path;
  }

  @override
  void cancelRecording() {
    // Add code to delete recording here
    recorderController.stop();
  }

  void dispose() {
    recorderController.dispose();
  }
}