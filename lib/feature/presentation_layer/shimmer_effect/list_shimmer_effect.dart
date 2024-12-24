import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmerEffect extends StatelessWidget {

  const ListShimmerEffect(
 );

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(child: Container(
      height:20,
      width: 30,
    ), baseColor: Colors.grey.shade300, highlightColor: Colors.red);
  }
}