import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class ScoreCard extends StatelessWidget {
  final double score;
  const ScoreCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            score.toString(),
          ).fontSize(18).textColor(Colors.white).bold(),
        ),
      ),
    );
  }
}
