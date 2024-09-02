import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psventuresassignment/themes/pallete.dart';

class CustomTextStyles {
  static TextStyle titleTextStyleBold = TextStyle(
    color: Pallete.blackColor,
    fontSize: 14.sp,
    letterSpacing: 2,
    fontWeight: FontWeight.w700,
  );

  static TextStyle titleTextStyle = TextStyle(
    color: Pallete.blackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle subTitleTextStyleBold = TextStyle(
    color: Pallete.blackColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subTitleTextStyle = TextStyle(
    color: Pallete.blackColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyTextStyle = TextStyle(
    color: Pallete.blackColor,
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyTextStyleBold = TextStyle(
    color: Pallete.blackColor,
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyTextStyleLarge = TextStyle(
    color: Pallete.blackColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}
