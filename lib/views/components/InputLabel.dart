import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String labelText;
  const InputLabel({
    Key key, this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(labelText,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),);
  }
}