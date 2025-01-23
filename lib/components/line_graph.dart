import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myapp/enums.dart';

class LineGraphWidget extends StatefulWidget {
  const LineGraphWidget({
    super.key,
    required this.lineAlgorithm,
    required this.initialPoint,
    required this.finalPoint,
  });

  final LineAlgorithm lineAlgorithm;
  final List<int> initialPoint;
  final List<int> finalPoint;

  @override
  State<LineGraphWidget> createState() => _LineGraphWidgetState();
}

class _LineGraphWidgetState extends State<LineGraphWidget> {
  String time = "";
  List<FlSpot> _generateLineSpots() {
    int x0 = widget.initialPoint[0],
        y0 = widget.initialPoint[1],
        x1 = widget.finalPoint[0],
        y1 = widget.finalPoint[1];

    Stopwatch stopwatch = Stopwatch()..start();
    List<Point<int>> points = widget.lineAlgorithm.algorithm(x0, y0, x1, y1);
    stopwatch.stop();
    
setState(() {
time = stopwatch.elapsedMicroseconds.toString();
  
});
    return points
        .map((point) => FlSpot(point.x.toDouble(), point.y.toDouble()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("$time microseconds"),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: const FlTitlesData(show: true),
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
          ),
        ],
      ),
    );
  }
}
