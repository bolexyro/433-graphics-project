import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:myapp/enums.dart';
import 'package:myapp/screens/graph_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _x0Controller = TextEditingController();
  final TextEditingController _y0Controller = TextEditingController();
  final TextEditingController _x1Controller = TextEditingController();
  final TextEditingController _y1Controller = TextEditingController();
  final TextEditingController _radiusController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AlgorithmType? _selectedAlgorithmType;
  LineAlgorithm _selectedLineAlgorithm = LineAlgorithm.bresenham;
  CircleAlgorithm _selectedCircleAlgorithm = CircleAlgorithm.bresenham;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(title: const Text('Drawing Algorithms')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<AlgorithmType>(
                  value: _selectedAlgorithmType,
                  hint: const Text('Line or Circle'),
                  items: const [
                    DropdownMenuItem(
                      value: AlgorithmType.lineDrawing,
                      child: Text('Line Drawing Algorithms'),
                    ),
                    DropdownMenuItem(
                      value: AlgorithmType.circleDrawing,
                      child: Text('Circle Drawing Algorithms'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedAlgorithmType = value!;
                    });
                  },
                ),
                const Gap(20),
                if (_selectedAlgorithmType != null &&
                    _selectedAlgorithmType == AlgorithmType.lineDrawing)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appTextFormField(
                        labelText: 'Initial X (x0)',
                        controller: _x0Controller,
                      ),
                      const Gap(16),
                      appTextFormField(
                        labelText: 'Initial Y (y0)',
                        controller: _y0Controller,
                      ),
                      const Gap(16),
                      appTextFormField(
                        labelText: 'End X (x1)',
                        controller: _x1Controller,
                      ),
                      const Gap(16),
                      appTextFormField(
                        labelText: 'End Y (y1)',
                        controller: _y1Controller,
                      ),
                      const Gap(16),
                      DropdownButton<LineAlgorithm>(
                        value: _selectedLineAlgorithm,
                        items: const [
                          DropdownMenuItem(
                            value: LineAlgorithm.bresenham,
                            child: Text('Bresenham'),
                          ),
                          DropdownMenuItem(
                            value: LineAlgorithm.dda,
                            child: Text('DDA'),
                          ),
                          DropdownMenuItem(
                            value: LineAlgorithm.midpoint,
                            child: Text('Midpoint'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedLineAlgorithm = value!;
                          });
                        },
                      ),
                    ],
                  ),
                if (_selectedAlgorithmType != null &&
                    _selectedAlgorithmType == AlgorithmType.circleDrawing)
                  Column(
                    children: [
                      appTextFormField(
                          labelText: 'Center X (xc)',
                          controller: _x0Controller),
                      const Gap(16),
                      appTextFormField(
                          labelText: 'Center Y (yc)',
                          controller: _y0Controller),
                      const Gap(16),
                      appTextFormField(
                          labelText: 'Radius', controller: _radiusController),
                      const Gap(16),
                      DropdownButton<CircleAlgorithm>(
                        value: _selectedCircleAlgorithm,
                        items: const [
                          DropdownMenuItem(
                            value: CircleAlgorithm.bresenham,
                            child: Text('Bresenham Circle'),
                          ),
                          DropdownMenuItem(
                            value: CircleAlgorithm.midpoint,
                            child: Text('Midpoint Circle'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCircleAlgorithm = value!;
                          });
                        },
                      ),
                    ],
                  ),
                const Gap(16),
                if (_selectedAlgorithmType != null)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GraphScreen(
                                parameters: _selectedAlgorithmType ==
                                        AlgorithmType.lineDrawing
                                    ? LineAlgorithmParameters(
                                        lineAlgorithm: _selectedLineAlgorithm,
                                        initialPoint: [
                                          int.parse(_x0Controller.text),
                                          int.parse(_y0Controller.text)
                                        ],
                                        finalPoint: [
                                          int.parse(_x1Controller.text),
                                          int.parse(_y1Controller.text)
                                        ],
                                      )
                                    : CircleAlgorithmParameters(
                                        circleAlgorithm:
                                            _selectedCircleAlgorithm,
                                        centerPoints: [
                                          int.parse(_x0Controller.text),
                                          int.parse(_y0Controller.text)
                                        ],
                                        radius:
                                            int.parse(_radiusController.text),
                                      ),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Generate Graph'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextFormField appTextFormField({
  required String labelText,
  required TextEditingController controller,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a value';
      }
      return null;
    },
  );
}
