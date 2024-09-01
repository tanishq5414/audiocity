import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psventuresassignment/routes/app_pages.dart';
import 'package:psventuresassignment/routes/app_routes.dart';

class NavigationController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late String title;

  @override
  void onInit() {
    tabController = TabController(length: AppPages.pages.length, vsync: this);
    title = AppPages.pages[0].title??"";
    super.onInit();
  }

  changeIndex(int index) {
    tabController.animateTo(index);
    title = AppPages.pages[index].title??"";
    update();
  }

}