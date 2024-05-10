import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Theme/colors.dart';

class GradientLinearProgressIndicator extends StatelessWidget {
  const GradientLinearProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          LinearPercentIndicator(
            width: 190.w,
            lineHeight: 10.h,
            percent: 0.5,
            animation: true,
            animationDuration: 500,
            linearStrokeCap: LinearStrokeCap.butt,
            barRadius: const Radius.circular(6),
            padding: const EdgeInsets.all(0),
            backgroundColor: Colors.grey,
            progressColor: Colors.transparent, // Transparent color
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    primaryBlueColor,
                    primaryBlueGradientDarkColor
                  ], // Your gradient colors
                  stops: const [0.0, 1.0], // Optional stops for each color
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
