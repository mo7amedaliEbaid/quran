import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/utils/routes_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/widgets/component.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';

class HomeCard extends StatelessWidget {
  final String screen;
  final String url;
  final String label;

  const HomeCard(
      {Key? key, required this.screen, required this.url, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorManager.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {

          navigator(context, screen);
          // Navigator.pushNamed(context, screen!);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FadeIn(
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  url,
                  width: 45.w,
                  height: 45.h,
                ),
              ),
              TextCustom(
                  height: 0.0,
                  text: label,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }
}
