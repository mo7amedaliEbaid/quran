import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/widgets/shimmer_custom/shimmer_custom.dart';

import '../../utils/color_manager.dart';

class ListShimmer extends StatelessWidget {
  const ListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerCustom(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 8,
      shrinkWrap: true,
      itemExtent: 80,
      itemBuilder: (BuildContext context, int index) => Container(
        // width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0.r),
          color: ColorManager.grey,
        ),
      ),
    ));
  }
}
