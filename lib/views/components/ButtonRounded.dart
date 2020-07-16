import 'package:flutter/material.dart';
import 'package:winninbets/constants/colors.dart';

class ButtonRounded extends StatelessWidget {
  final String text;
  final Function onTap;
  const ButtonRounded({
    Key key, this.text, this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0.0, 10.0),
              blurRadius: 30,
            )
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FlatButton(
          padding: EdgeInsets.all(15),
          color: clrPrimary,
          onPressed: onTap,
          child: Text(text, style: TextStyle(
              color: clrTertiary,
              fontWeight: FontWeight.w700,
              fontSize: 16
          ),),

        ),
      ),
    );
  }
}