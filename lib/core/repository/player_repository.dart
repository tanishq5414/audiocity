import 'package:audio_waveforms/audio_waveforms.dart';

class IPlayerRepository {
  void startPlaying(String path) {}
  void pausePlaying() {}
  void resumePlaying() {}
  void stopPlaying() {}
  void getWaveformData(String path) async {}
}

class PlayerRepository implements IPlayerRepository {
  PlayerController playerController = PlayerController();

  @override
  Future<void> startPlaying(String path) async{
    await playerController.preparePlayer(path: path, shouldExtractWaveform: true);
    playerController.startPlayer();
  }

  @override
  Future<List<double>> getWaveformData(String path) async {
    final waveFormData = await playerController.extractWaveformData(path: path);
    return waveFormData;
  }

  @override
  void pausePlaying() {
    playerController.pausePlayer();
  }

  @override
  void resumePlaying() {
    playerController.startPlayer();
  }

  @override
  void stopPlaying() {
    playerController.stopAllPlayers();
  }

  void dispose() {
    playerController.dispose();
  }
}

