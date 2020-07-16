import 'package:flutter/material.dart';

class LatestFixture extends StatelessWidget {
  const LatestFixture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("14.30 hrs", style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700
          ),),
          SizedBox(height: 3,),
          Row(
            children: <Widget>[
              Expanded(
                child: Text("Norwich", style: TextStyle(
                    fontWeight: FontWeight.w900
                ),),
              ),
              Expanded(
                child: Text("VS"),
              ),
              Expanded(
                child: Text("Brighton Albion", style: TextStyle(
                    fontWeight: FontWeight.w900
                ),),
              ),
            ],
          ),
          SizedBox(height: 7.5,),
          Row(
            children: <Widget>[
              Expanded(
                child: Text("1.56"),
              ),
              Expanded(
                child: Text("2.78"),
              ),
              Expanded(
                child: Text("1.23"),
              ),
            ],
          ),
          SizedBox(height: 7.5,),
          Text("Pick: Home Win | 1.56"),
          Divider(
            color: Colors.black12,
            height: 20,
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}