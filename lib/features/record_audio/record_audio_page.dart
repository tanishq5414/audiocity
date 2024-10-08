import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:psventuresassignment/common/icon_button.dart';
import 'package:psventuresassignment/features/record_audio/record_audio_controller.dart';
import 'package:psventuresassignment/themes/pallete.dart';
import 'package:psventuresassignment/themes/styles.dart';

class RecordAudioPage extends StatelessWidget {
  const RecordAudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Pallete.primaryColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<RecordAudioController>(
            init: RecordAudioController(),
            builder: (RecordAudioController controller) {
              return SingleChildScrollView(
                child: Column(
                  // verticalDirection: VerticalDirection.up,
                  children: [
                    SizedBox(
                      height: size.height * 0.85,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: size.height * 0.5,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Pallete.primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Pallete.teritiaryColor,
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Text('Record your voice',
                                  style: CustomTextStyles.subTitleTextStyleBold),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                width: size.width,
                                child: AudioWaveforms(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    waveStyle: const WaveStyle(
                                      middleLineColor: Pallete.blackColor,
                                      extendWaveform: true,
                                      showMiddleLine: true,
                                      waveThickness: 6.0,
                                      scaleFactor: 100.0,
                                      middleLineThickness: 4.0,
                                      waveColor: Pallete.secondaryColor,
                                    ),
                                    size: Size(size.width, 150),
                                    recorderController: controller
                                        .recorderRepository.recorderController),
                              ),
                              StreamBuilder<Duration>(
                                stream: controller.onCurrentDurationChanged,
                                builder: (context, snapshot) {
                                  var duration =
                                      snapshot.data?.toHHMMSS() ?? '00:00';
                                  return Text(
                                    snapshot.data != null
                                        ? duration.split(":").sublist(1).join(":")
                                        : '00:00',
                                    style: CustomTextStyles.titleTextStyleBold,
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              (!controller.isRecording)
                                  ? CommonIconButton(
                                      color: Pallete.redColor,
                                      icon: const LineIcon.microphone(),
                                      onPressed: () {
                                        controller.startRecording(context);
                                      },
                                      subtitle: 'Start record',
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        (!controller.isRecordingPaused)
                                            ? CommonIconButton(
                                                color: Pallete.blackColor,
                                                icon: const LineIcon.pause(),
                                                onPressed: () {
                                                  controller.pauseRecording();
                                                },
                                                subtitle: 'Pause record',
                                              )
                                            : CommonIconButton(
                                                color: Pallete.blackColor,
                                                icon: const LineIcon.play(),
                                                onPressed: () {
                                                  controller.resumeRecording();
                                                },
                                                subtitle: 'Resume record',
                                              ),
                                        const SizedBox(width: 30),
                                        CommonIconButton(
                                          color: Pallete.redColor,
                                          icon: const Icon(Icons.stop),
                                          onPressed: () {
                                            controller.saveRecording(context);
                                          },
                                          subtitle: 'Stop record',
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
