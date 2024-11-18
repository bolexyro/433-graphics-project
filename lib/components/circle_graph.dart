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

    // Find min and max values to adjust the graph scale
    final xValues = circlePoints.map((p) => p.x).toList();
    final yValues = circlePoints.map((p) => p.y).toList();
    final xMin = (xValues.reduce((a, b) => a < b ? a : b) - radius).toDouble();
    final xMax = (xValues.reduce((a, b) => a > b ? a : b) + radius).toDouble();
    final yMin = (yValues.reduce((a, b) => a < b ? a : b) - radius).toDouble();
    final yMax = (yValues.reduce((a, b) => a > b ? a : b) + radius).toDouble();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: ScatterChart(
          ScatterChartData(
            scatterSpots: circlePoints.map((point) {
              return ScatterSpot(
                point.x.toDouble(),
                point.y.toDouble(),
                dotPainter: FlDotCirclePainter(color: Colors.blue),
              );
            }).toList(),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(show: true),
            minX: xMin,
            maxX: xMax,
            minY: yMin,
            maxY: yMax,
          ),
        ),
      ),
    );
  }
}
