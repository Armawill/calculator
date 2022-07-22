import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final text;
  final VoidCallback func;

  CalcButton(this.text, this.func);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: ValueKey(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
      onPressed: func,
    );
  }
}
