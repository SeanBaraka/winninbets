import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winninbets/constants/colors.dart';

class InputBox extends StatelessWidget {
  final String icon;
  final String hint;
  final bool secureText;
  final Function changed;
  const InputBox({
    Key key, this.changed,this.icon, this.hint, this.secureText
  }) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: clrLighter
              )
          )
      ),
      child: TextField(
        obscureText: secureText,
        onChanged: changed,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset(icon, width: 15, color: clrLighter),
          hintText: hint,
        ),
      ),
    );
  }
}