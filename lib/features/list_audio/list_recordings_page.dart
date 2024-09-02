import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:psventuresassignment/common/icon_button.dart';
import 'package:psventuresassignment/core/utils/utils.dart';
import 'package:psventuresassignment/features/list_audio/list_recordings_controller.dart';
import 'package:psventuresassignment/themes/pallete.dart';
import 'package:psventuresassignment/themes/styles.dart';

class ListRecordingsPage extends StatelessWidget {
  const ListRecordingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ListRecordingsController>(
          init: ListRecordingsController(),
          builder: (ListRecordingsController controller) {
            controller.playerRepository.playerController.onCompletion
                .listen((event) {
              controller.onCompletion();
            });
            return controller.recordings.isEmpty
                ? const Center(
                    child: Text('No recordings found'),
                  )
                : Center(
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: controller.recordings.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 30,
                                ),
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Pallete.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Pallete.teritiaryColor,
                                    width: 0.5,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          CommonIconButton(
                                            icon: (controller.isPlaying &&
                                                    controller.currentAudio
                                                            ?.path ==
                                                        controller
                                                            .recordings[index]
                                                            .filePath)
                                                ? const LineIcon
                                                    .pause()
                                                : const LineIcon.play(),
                                            onPressed: () {
                                              if (controller.isPlaying &&
                                                  controller
                                                          .currentAudio?.path ==
                                                      controller
                                                          .recordings[index]
                                                          .filePath) {
                                                controller.stopPlaying();
                                              } else {
                                                controller.playRecording(
                                                    controller.recordings[index]
                                                        .filePath);
                                              }
                                            },
                                            color: (controller.isPlaying &&
                                                    controller.currentAudio
                                                            ?.path ==
                                                        controller
                                                            .recordings[index]
                                                            .filePath)
                                                ? Pallete.blackColor
                                                : Pallete.redColor
                                                    .withOpacity(0.6),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            width: size.width * 0.4,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 15,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Text(
                                                      controller
                                                          .recordings[index]
                                                          .fileName
                                                          .split('.')
                                                          .first,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles.bodyTextStyleBold,
                                                    )),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 5,
                                                        vertical: 2,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Pallete
                                                            .lightGreyColor,
                                                      ),
                                                      child: Text(
                                                          controller
                                                              .recordings[index]
                                                              .fileName
                                                              .split('.')
                                                              .last
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                            color: Pallete
                                                                .blackColor,
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      Utils.getFormattedDate(
                                                        controller
                                                            .recordings[index]
                                                            .creationDate,
                                                      ),
                                                      style: const TextStyle(
                                                        color: Pallete
                                                            .darkGreyColor,
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                Utils.getFormattedDuration(
                                                  controller.recordings[index]
                                                      .duration,
                                                ),
                                                style: CustomTextStyles.subTitleTextStyle.copyWith(
                                                  color: Pallete.lightGreyColor,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                "${controller.recordings[index].fileSize} MB",
                                                style: CustomTextStyles.bodyTextStyle.copyWith(
                                                  color: Pallete.lightGreyColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              iconSize: 20,
                                              icon: const Icon(Icons.share),
                                              onPressed: () {
                                                controller.shareRecording(
                                                  controller.recordings[index]
                                                      .filePath,
                                                );
                                              },
                                              color: Pallete.blackColor
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // const SizedBox(height: 10),
                              controller.isPlaying &&
                                      controller.currentAudio?.path ==
                                          controller.recordings[index].filePath
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: Pallete.primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Pallete.teritiaryColor,
                                          width: 0.5,
                                        ),
                                      ),
                                      // height: 100,
                                      width: size.width * 0.8,
                                      child: AudioFileWaveforms(
                                        size: Size(size.width * 0.8, 100),
                                        waveformData: controller.waveFormData,
                                        playerController: controller
                                            .playerRepository.playerController,
                                        playerWaveStyle: const PlayerWaveStyle(
                                          showSeekLine: true,
                                          fixedWaveColor:
                                              Pallete.secondaryColor,
                                          liveWaveColor: Pallete.secondaryColor,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          );
                        },
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
