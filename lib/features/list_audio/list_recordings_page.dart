import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:psventuresassignment/common/icon_button.dart';
import 'package:psventuresassignment/core/utils/utils.dart';
import 'package:psventuresassignment/features/list_audio/list_recordings_controller.dart';
import 'package:psventuresassignment/themes/pallete.dart';
import 'package:timeago/timeago.dart' as timeago;


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
            return controller.recordings.isEmpty
                ? const Center(
                    child: Text('No recordings found'),
                  )
                : Center(
                    child: ListView.builder(
                      itemCount: controller.recordings.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                CommonIconButton(
                                  icon: const LineIcon.play(),
                                  onPressed: () {},
                                  color: Pallete.redColor.withOpacity(0.7),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: size.width * 0.4,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 15,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            controller.recordings[index].fileName,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Pallete.blackColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                            ),
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Pallete.lightGreyColor,
                                            ),
                                            child: const Text('M4A', style: TextStyle(
                                              color: Pallete.blackColor,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                            )),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            Utils.getFormattedDate(
                                              controller.recordings[index].creationDate,
                                            ),
                                            style: const TextStyle(
                                              color: Pallete.darkGreyColor,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      Utils.getFormattedDuration(
                                        controller.recordings[index].duration,
                                      ),
                                      style: const TextStyle(
                                        color: Pallete.darkGreyColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${controller.recordings[index].fileSize}MB",
                                      style: const TextStyle(
                                        color: Pallete.darkGreyColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
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
                                      // controller.deleteRecording(index);
                                    },
                                    color: Pallete.blackColor.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
