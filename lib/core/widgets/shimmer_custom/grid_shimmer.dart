import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hesn_elmuslim/core/utils/color_manager.dart';
import 'package:hesn_elmuslim/core/widgets/shimmer_custom/shimmer_custom.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerCustom(
        child: GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Container(
        // width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0.r),
            color: ColorManager.grey),
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    ));
  }
}
