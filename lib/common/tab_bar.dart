import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:psventuresassignment/constants/icons_path.dart';
import 'package:psventuresassignment/features/navigation/navigation_controller.dart';
import 'package:psventuresassignment/themes/pallete.dart';

class CommonTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NavigationController(),
      builder: (controller) => AppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(IconsPath.appIcon)
        ),
        titleSpacing: 0,
        title: Text(
          controller.title,
          style: const TextStyle(
            color: Pallete.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        bottom: TabBar(
          // isScrollable: true,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          labelColor: Pallete.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          labelPadding: EdgeInsets.zero,
          onTap: (value) => controller.changeIndex(value),
          controller: controller.tabController,
          tabs: [
            Tab(
              child: TabBarPill(
                isActive: controller.tabController.index == 0,
                icon: const LineIcon.microphone(),
              ),
            ),
            Tab(
              child: TabBarPill(
                isActive: controller.tabController.index == 1,
                icon: const Icon(Icons.list),
              ),
            ),
            Tab(
              child: TabBarPill(
                isActive: controller.tabController.index == 2,
                icon: const Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

class TabBarPill extends StatelessWidget {
  final bool isActive;
  final Icon icon;
  const TabBarPill({
    this.isActive = false,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive ? Pallete.secondaryColor : Pallete.backgroundColor,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              'Record',
              style: TextStyle(
                color: isActive ? Pallete.whiteColor : Pallete.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        )
      );
  }
}
