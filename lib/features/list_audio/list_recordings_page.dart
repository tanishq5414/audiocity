import 'package:flutter/material.dart';


class ListRecordingsPage extends StatelessWidget {
  const ListRecordingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Add code to record audio here
            },  
            child: const Text('List Recordings'),
          ),
        ),
      ),
    );
  }
}

