import 'package:administrator/helpers/app_constants.dart';
import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final double percentage;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * (percentage / 100),
              height: 5,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      );
}
