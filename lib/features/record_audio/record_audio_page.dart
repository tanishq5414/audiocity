import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/features/record_audio/record_audio_controller.dart';

class RecordAudioPage extends StatelessWidget {
  const RecordAudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GetBuilder<RecordAudioController>(
            init: RecordAudioController(),
            builder: (RecordAudioController controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<Duration>(
                    stream: controller.onCurrentDurationChanged,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data != null
                            ? snapshot.data.toString()
                            : '00:00:00',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.isRecording) {
                        controller.saveRecording(context);
                      } else {
                        controller.startRecording(context);
                      }
                    },
                    icon: controller.isRecording
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.mic),
                  ),
                  AudioWaveforms(
                      waveStyle: const WaveStyle(
                        extendWaveform: true,
                        showMiddleLine: false,
                      ),
                      size: Size(size.width, 200),
                      recorderController:
                          controller.recorderRepository.recorderController),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
