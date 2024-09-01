import 'package:flutter/material.dart';
import 'package:psventuresassignment/features/navigation/navigation_page.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Add code to record audio here
            },  
            child: const Text('Record Audio'),
          ),
        ),
      ),
    );
  }
}

