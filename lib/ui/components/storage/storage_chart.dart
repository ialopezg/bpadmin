import 'package:administrator/helpers/app_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StorageChart extends StatelessWidget {
  const StorageChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200,
        child: Stack(
          children: <Widget>[
            PieChart(
              PieChartData(
                sections: chartData,
                sectionsSpace: 0.0,
                centerSpaceRadius: 70,
                startDegreeOffset: -90,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: defaultPadding),
                  Text(
                    '29.1',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 0.5,
                        ),
                  ),
                  const Text('of 128 GB'),
                ],
              ),
            ),
          ],
        ),
      );
}

List<PieChartSectionData> chartData = [
  PieChartSectionData(
    color: primaryColor,
    value: 25.0,
    showTitle: false,
    radius: 25.0,
  ),
  PieChartSectionData(
    color: const Color(0xFF26E5FF),
    value: 20.0,
    showTitle: false,
    radius: 22.0,
  ),
  PieChartSectionData(
    color: const Color(0xFFFFCF26),
    value: 10.0,
    showTitle: false,
    radius: 19.0,
  ),
  PieChartSectionData(
    color: const Color(0xFFEE2727),
    value: 15.0,
    showTitle: false,
    radius: 16.0,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 25.0,
    showTitle: false,
    radius: 13.0,
  ),
];
