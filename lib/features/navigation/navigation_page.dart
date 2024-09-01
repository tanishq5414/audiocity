import 'package:flutter/material.dart';
import 'package:psventuresassignment/common/tab_bar.dart';


class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CommonTabBar(),
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

