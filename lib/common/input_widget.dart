import 'package:flutter/material.dart';
import 'package:psventuresassignment/common/snack_bar.dart';
import 'package:psventuresassignment/themes/pallete.dart';
import 'package:psventuresassignment/themes/styles.dart';

void inputWidgetDialog(BuildContext context, Function(String) onSubmitted, String title, {String? initialValue}) {
  final TextEditingController controller = TextEditingController();

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Pallete.primaryColor,
        title:
            Text(title, style: CustomTextStyles.titleTextStyleBold),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Type something',
            hintStyle: CustomTextStyles.subTitleTextStyleBold,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.secondaryColor)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.secondaryColor)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              String inputValue = controller.text;
              if (inputValue.isEmpty) {
                showCommonSnackBar(context, 'Please enter a value');
                return;
              }
              onSubmitted(inputValue);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              'Submit',
              style: CustomTextStyles.subTitleTextStyleBold
                  .copyWith(color: Pallete.secondaryColor),
            ),
          ),
        ],
      );
    },
  );
}
