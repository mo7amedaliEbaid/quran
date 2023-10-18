import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/utils/font_manager.dart';
import 'package:hesn_elmuslim/core/utils/values_manager.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';

class HomeItem extends StatelessWidget {
  final String title;
  final List<Widget> widgets;

  const HomeItem({
    required this.title,
    required this.widgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.sp),
          child: TextCustom(
            letterSpacing: 0.4,
            text: title,
            fontSize: FontSize.s20.sp,
            fontWeight: FontWeightManager.bold,
          ),
        ),
        SizedBox(
          // width: context.width/1.2,
          height: AppSize.s100.h,
          child:Row(
            children: widgets,
          ),
        ),
      ],
    );
  }
}
