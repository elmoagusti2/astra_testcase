import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmers {
  static Widget shimmerCustom({double? width, double? height}) {
    return Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: Colors.grey,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
