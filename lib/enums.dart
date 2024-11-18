import 'dart:math';

import 'package:myapp/algorithms/circle_algorithms/bresenham_circle.dart';
import 'package:myapp/algorithms/circle_algorithms/midpoint_circle.dart';
import 'package:myapp/algorithms/line_algorithms/bresenham_line.dart';
import 'package:myapp/algorithms/line_algorithms/dda.dart';
import 'package:myapp/algorithms/line_algorithms/mid_point_line.dart';

enum AlgorithmType {
  lineDrawing('Line Drawing Algorithms'),
  circleDrawing('Circle Drawing Algorithms');

  final String label;
  const AlgorithmType(this.label);
}

enum LineAlgorithm {
  bresenham('Bresenham Line Drawing Algorithm', bresenhamLine),
  dda('DDA Line Drawing Algorithm', ddaLine),
  midpoint('Midpoint Line Drawing Algorithm', midpointLine);

  final String name;
  final List<Point<int>> Function(int, int, int, int) algorithm;
  const LineAlgorithm(this.name, this.algorithm);
}

enum CircleAlgorithm {
  bresenham('Bresenham Circle Algorithm', bresenhamCircle),
  midpoint('Midpoint Circle Algorithm', midpointCircle);

  final String name;
  final List<Point<int>> Function(int, int, int) algorithm;
  const CircleAlgorithm(this.name, this.algorithm);
}

class Parameters {
  const Parameters(this.name);
  final String name;
}

class LineAlgorithmParameters extends Parameters {
  LineAlgorithmParameters(
      {required this.lineAlgorithm,
      required this.initialPoint,
      required this.finalPoint})
      : super(lineAlgorithm.name);
  final LineAlgorithm lineAlgorithm;
  final List<int> initialPoint;
  final List<int> finalPoint;
}

class CircleAlgorithmParameters extends Parameters {
  CircleAlgorithmParameters({
    required this.circleAlgorithm,
    required this.centerPoints,
    required this.radius,
  }) : super(circleAlgorithm.name);

  final CircleAlgorithm circleAlgorithm;
  final List<int> centerPoints;
  final int radius;
}
