import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/constants/icons_path.dart';
import 'package:psventuresassignment/features/navigation/navigation_controller.dart';
import 'package:psventuresassignment/routes/app_routes.dart';
import 'package:psventuresassignment/themes/pallete.dart';
import 'package:psventuresassignment/themes/styles.dart';

class CommonTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder(
      init: NavigationController(),
      builder: (controller) => AppBar(
        backgroundColor: Pallete.primaryColor,
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 25,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset(IconsPath.appIcon)),
            Text(
              'Audiocity',
              style: CustomTextStyles.titleTextStyleBold,
            ),
          ],
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(size.width, 40),
          child: ColoredBox(
            color: Pallete.whiteColor,
            child: TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Pallete.secondaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              labelColor: Pallete.secondaryColor,
              unselectedLabelColor: Pallete.blackColor,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              labelPadding: EdgeInsets.zero,
              onTap: (value) => controller.changeIndex(value),
              controller: controller.tabController,
              tabs: [
                Tab(
                  child: TabBarPill(
                    isActive: controller.tabController.index == 0,
                    title: AppRoutes.recordAudio.name,
                  ),
                ),
                Tab(
                  child: TabBarPill(
                    title: AppRoutes.listRecordings.name,
                    isActive: controller.tabController.index == 1,
                  ),
                ),
                Tab(
                  child: TabBarPill(
                    title: AppRoutes.settings.name,
                    isActive: controller.tabController.index == 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class TabBarPill extends StatelessWidget {
  final bool isActive;
  final String title;
  const TabBarPill({
    this.isActive = false,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (isActive)
                ? Container(
                    width: 10,
                    decoration: const BoxDecoration(
                        color: Pallete.secondaryColor, shape: BoxShape.circle),
                  )
                : const SizedBox(width: 0),
            const SizedBox(width: 10),
            Text(
              title,
              style: CustomTextStyles.subTitleTextStyleBold.copyWith(
                color: isActive ? Pallete.secondaryColor : Pallete.blackColor,
              ),
            ),
          ],
        ));
  }
}
