import 'package:flutter/material.dart';
import 'package:homefort/commons/color_definations.dart';
import 'package:shimmer/shimmer.dart';

class BlockShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  const BlockShimmer({Key? key, this.height, this.width, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorDefination.shimmerBaseColor,
      highlightColor: ColorDefination.shimmerHighlightColor,
      enabled: true,
      child: Container(
        width: width ?? 70,
        height: height ?? 10,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          color: ColorDefination.shimmerBaseColor,
        ),
      ),
    );
  }
}

class RoundedShimmer extends StatelessWidget {
  final double? height;
  final double? width;

  const RoundedShimmer({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorDefination.shimmerBaseColor,
      highlightColor: ColorDefination.shimmerHighlightColor,
      enabled: true,
      child: Container(
        width: width ?? 35,
        height: height ?? 35,
        decoration: BoxDecoration(
          color: ColorDefination.shimmerBaseColor,
          shape: BoxShape.circle,
          border: Border.all(width: .5),
        ),
      ),
    );
  }
}
