import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psventuresassignment/themes/pallete.dart';
import 'package:psventuresassignment/themes/styles.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showCommonSnackBar(BuildContext context, String content) {
  try {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
            child: Text(
          content,
          maxLines: 2,
          style:
              CustomTextStyles.subTitleTextStyleBold.copyWith(color: Colors.white),
        )),
        backgroundColor: Pallete.greyColor,
        duration: const Duration(seconds: 2),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print(content);
    }
  }
}
