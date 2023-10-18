import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color_manager.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? shimmerHeight;
  final double? shimmerWidth;
  final double? boarder;
  final BoxFit? boxFit;

  const CachedNetworkImageCustom({
    Key? key,
    required this.url,
    this.height = 100,
    this.width = double.infinity,
    this.shimmerHeight = 100,
    this.shimmerWidth = double.infinity,
    this.boarder = 10.0,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(boarder!),
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: boxFit,
          imageUrl: url,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[400]!,
            child: Container(
              clipBehavior: Clip.none,
              height: shimmerHeight,
              width: shimmerWidth,
              decoration: const BoxDecoration(
                //color: Colors.black,

                //  borderRadius: BorderRadius.circular(6.r),
                color: Colors.black26,
                //borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
              color: ColorManager.grey1,
              child: const Icon(
                Icons.error,
                color: ColorManager.primary,
              )),
        ),
      ),
    );
  }
}
