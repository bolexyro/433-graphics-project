

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myapp/enums.dart';

class CircleGraphWidget extends StatelessWidget {
  const CircleGraphWidget({
    super.key,
    required this.centerPoint,
    required this.radius,
    required this.circleAlgorithm,
  });

  final List<int> centerPoint;
  final int radius;
  final CircleAlgorithm circleAlgorithm;

  @override
  Widget build(BuildContext context) {
    final circlePoints =
        circleAlgorithm.algorithm(centerPoint[0], centerPoint[1], radius);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: ScatterChart(
          ScatterChartData(
            scatterSpots: circlePoints.map((point) {
              return ScatterSpot(point.x.toDouble(), point.y.toDouble());
            }).toList(),
            gridData: const FlGridData(show: true),
            // titlesData: const FlTitlesData(show: true),
          //   titlesData: const FlTitlesData(
          //   leftTitles: AxisTitles(
          //     sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          //   ),
          //   bottomTitles: AxisTitles(
          //     sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          //   ),
          // ),
            borderData: FlBorderData(show: true),
          ),
        ),
      ),
    );
  }
}
