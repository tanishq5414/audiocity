class IRecorderRepository {
  void startRecording() {}
  void stopRecording() {}
  void pauseRecording() {}
  void resumeRecording() {}
  void saveRecording() {}
  void deleteRecording() {}
}

class RecorderRepository implements IRecorderRepository {
  @override
  void startRecording() {
    // Add code to start recording here
  }

  @override
  void stopRecording() {
    // Add code to stop recording here
  }

  @override
  void pauseRecording() {
    // Add code to pause recording here
  }

  @override
  void resumeRecording() {
    // Add code to resume recording here
  }

  @override
  void saveRecording() {
    // Add code to save recording here
  }

  @override
  void deleteRecording() {
    // Add code to delete recording here
  }
}