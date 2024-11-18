import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myapp/enums.dart';

class LineGraphWidget extends StatelessWidget {
  const LineGraphWidget({
    super.key,
    required this.lineAlgorithm,
    required this.initialPoint,
    required this.finalPoint,
  });

  final LineAlgorithm lineAlgorithm;
  final List<int> initialPoint;
  final List<int> finalPoint;
  List<FlSpot> _generateLineSpots() {
    int x0 = initialPoint[0],
        y0 = initialPoint[1],
        x1 = finalPoint[0],
        y1 = finalPoint[1];
    List<Point<int>> points = lineAlgorithm.algorithm(x0, y0, x1, y1);

    return points
        .map((point) => FlSpot(point.x.toDouble(), point.y.toDouble()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true),
          titlesData: const FlTitlesData(
              // leftTitles: AxisTitles(
              //   sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              // ),
              // bottomTitles: AxisTitles(
              //   sideTitles: SideTitles(showTitles: true, reservedSize: 30),
              // ),
              show: true),
          borderData: FlBorderData(
            show: true,
            // border: Border.all(color: Colors.black, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: _generateLineSpots(),
              isCurved: false,
              barWidth: 2,
              color: Colors.blue,
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
