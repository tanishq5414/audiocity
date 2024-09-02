// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/features/settings/settings_controller.dart';
import 'package:psventuresassignment/themes/pallete.dart';
import 'package:psventuresassignment/themes/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<SettingsController>(
                init: SettingsController(),
                initState: (_) {},
                builder: (controller) {
                  return RawScrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'General Settings',
                            style: CustomTextStyles.subTitleTextStyle,
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            onTap: () => controller.changeSamplingRate(context),
                            contentPadding: EdgeInsets.zero,
                            title: Text('Sampling Rate',
                                style: CustomTextStyles.bodyTextStyleLarge
                                    .copyWith(color: Pallete.greyColor)),
                            subtitle:  Text('${controller.samplingRate} Hz', 
                                style: CustomTextStyles.bodyTextStyle
                                  .copyWith(color: Pallete.darkGreyColor)),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Advanced Settings',
                            style: CustomTextStyles.subTitleTextStyle,
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title:  Text('Ask for filename',
                                style: CustomTextStyles.bodyTextStyleLarge
                                    .copyWith(color: Pallete.greyColor)),
                            subtitle: Text(
                                'Ask for filename when recording stops',
                                style: CustomTextStyles.bodyTextStyle
                                  .copyWith(color: Pallete.darkGreyColor)),
                            trailing: Checkbox(
                                activeColor: Pallete.secondaryColor,
                                checkColor: Pallete.whiteColor,
                                side: BorderSide(color: Pallete.secondaryColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                value: controller.askForFileNames,
                                onChanged: (value) {
                                  controller.toggleFileNames(context);
                                }),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Danger Zone',
                            style: CustomTextStyles.subTitleTextStyle
                                .copyWith(color: Pallete.redColor),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title:  Text('Recordings folder',
                                style: CustomTextStyles.bodyTextStyleLarge
                                    .copyWith(color: Pallete.greyColor)),
                            subtitle: Text(
                              controller.currentPath,
                              style: CustomTextStyles.bodyTextStyle
                                  .copyWith(color: Pallete.darkGreyColor),
                            ),
                            onTap: () {
                              controller.changeFolderPath(context);
                            },
                          ),
                          Text(
                              'Changing the folder will delete all the previous recordings',
                              style: CustomTextStyles.bodyTextStyle
                                  .copyWith(color: Pallete.redColor)),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
