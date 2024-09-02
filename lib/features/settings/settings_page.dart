import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/common/snack_bar.dart';
import 'package:psventuresassignment/themes/pallete.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'General Settings',
              style: TextStyle(fontSize: 10, color: Pallete.greyColor),
            ),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Dark Mode', style: TextStyle(fontSize: 12, color: Pallete.greyColor)),
              subtitle: const Text('Enable Dark Mode', style: TextStyle(fontSize: 10, color: Pallete.lightGreyColor)),
              trailing: Transform.scale(
                scale: 0.5,
                child: Switch(
                  value: false,
                  onChanged: (value) {
                    showCommonSnackBar(context, 'Coming Soon');
                  },
                ),
              ),
            ),
            const Divider(
              height: 0.5,
              color: Pallete.lightGreyColor,
              thickness: 0.5,
            ),
            ListTile(
              onTap: () {
                showCommonSnackBar(context, 'Coming Soon');
              },
              contentPadding: EdgeInsets.zero,
              title: const Text('Recording Format', style: TextStyle(fontSize: 12, color: Pallete.greyColor)),
              subtitle: const Text('Enable Notifications', style: TextStyle(fontSize: 10, color: Pallete.lightGreyColor)),
            ),
            SizedBox(height: 20),
            const Text(
              'Advanced Settings',
              style: TextStyle(fontSize: 10, color: Pallete.greyColor),
            ),
            const SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Sample Rate', style: TextStyle(fontSize: 12, color: Pallete.greyColor)),
              subtitle: const Text('Enable Notifications', style: TextStyle(fontSize: 10, color: Pallete.lightGreyColor)),
              onTap: () {
                showCommonSnackBar(context, 'Coming Soon');
              },
            ),
             ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Recordings folder', style: TextStyle(fontSize: 12, color: Pallete.greyColor)),
              subtitle: const Text('Enable Notifications', style: TextStyle(fontSize: 10, color: Pallete.lightGreyColor)),
              onTap: () {
                showCommonSnackBar(context, 'Coming Soon');
              },
                
            ),
             ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Ask for filename', style: TextStyle(fontSize: 12, color: Pallete.greyColor)),
              subtitle: const Text('Enable Notifications', style: TextStyle(fontSize: 10, color: Pallete.lightGreyColor)),
              onTap: () {
                showCommonSnackBar(context, 'Coming Soon');
              },
                
            ),

          ],
        ),
      )),
    );
  }
}
