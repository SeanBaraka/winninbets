import 'package:flutter/material.dart';

class LinkLabel extends StatelessWidget {
  final String labelText;
  final Function press;
  const LinkLabel({
    Key key, this.labelText, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(labelText, style: TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w700
      ),),
    );
  }
}
