import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:psventuresassignment/themes/pallete.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showCommonSnackBar(BuildContext context, String content) {
  try {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: Pallete.secondaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print(content);
    }
  }
}
