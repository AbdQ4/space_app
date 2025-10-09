import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/colors_manager.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.subTitle = "",
  });

  final String title;
  String subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.red,
        foregroundColor: ColorsManager.white,
        fixedSize: Size(342.w, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title $subTitle", style: TextStyle(fontSize: 20.sp)),
          Icon(Icons.arrow_forward_ios, size: 22.sp),
        ],
      ),
    );
  }
}
