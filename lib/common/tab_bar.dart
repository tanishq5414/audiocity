import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/features/navigation/navigation_controller.dart';

class CommonTabBar extends StatelessWidget implements PreferredSizeWidget{
  const CommonTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NavigationController(),
      builder: (controller) =>
      AppBar(
        title: Text(controller.title),
        actions: [IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: (){},
        ),],
        bottom: TabBar(
          onTap: (value) => controller.changeIndex(value),
          controller: controller.tabController,
          tabs: const [
             Tab(
              child: Icon(Icons.radio_button_checked_outlined),
            ),
             Tab(
              child: Icon(Icons.list)
            ),
            Tab(
              child: Icon(Icons.settings)
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}