import 'package:flutter/material.dart';
import 'package:myapp/components/circle_graph.dart';
import 'package:myapp/components/line_graph.dart';
import 'package:myapp/enums.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({
    super.key,
    required this.parameters,
  });

  final Parameters parameters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(parameters.name)),
      body: parameters is LineAlgorithmParameters
          ? LineGraphWidget(
              lineAlgorithm:
                  (parameters as LineAlgorithmParameters).lineAlgorithm,
              initialPoint:
                  (parameters as LineAlgorithmParameters).initialPoint,
              finalPoint: (parameters as LineAlgorithmParameters).finalPoint,
            )
          : CircleGraphWidget(
              centerPoint:
                  (parameters as CircleAlgorithmParameters).centerPoints,
              radius: (parameters as CircleAlgorithmParameters).radius,
              circleAlgorithm:
                  (parameters as CircleAlgorithmParameters).circleAlgorithm,
            ),
    );
  }
}
