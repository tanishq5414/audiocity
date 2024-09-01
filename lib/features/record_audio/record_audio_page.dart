import 'package:flutter/material.dart';

class RecordAudioPage extends StatelessWidget {
  const RecordAudioPage({super.key});

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

