import 'package:flutter/material.dart';

import './screens/calculator_screen.dart';
import './screens/unit_converter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: UnitConverterScreen(),
    );
  }
}
