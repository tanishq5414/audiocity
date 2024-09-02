import 'package:flutter/material.dart';
import 'package:psventuresassignment/common/snack_bar.dart';
import 'package:psventuresassignment/themes/pallete.dart';

void fileNameInputDialog(BuildContext context, Function(String) onSubmitted) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Enter file name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Type something'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                String inputValue = controller.text;
                if(inputValue.isEmpty){
                  showCommonSnackBar(context, 'Please enter a file name');
                  return;
                }
                onSubmitted(inputValue);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Submit', style: TextStyle(color: Pallete.secondaryColor)),
            ),
          ],
        );
      },
    );
  }
