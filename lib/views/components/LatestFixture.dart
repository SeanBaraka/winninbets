import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestFixture extends StatelessWidget {
  final home_team,away_team, date, prediction, prediction_odds, home_odds, draw_odds, away_odds;
  const LatestFixture({
    Key key, this.home_team, this.away_team, this.date, this.prediction, this.prediction_odds, this.home_odds, this.draw_odds, this.away_odds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return Container(
      padding: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(formatter.format(DateTime.parse(date)), style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700
          ),),
          SizedBox(height: 3,),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(home_team, style: TextStyle(
                    fontWeight: FontWeight.w900
                ),),
              ),
              Expanded(
                child: Text("VS"),
              ),
              Expanded(
                child: Text(away_team, style: TextStyle(
                    fontWeight: FontWeight.w900
                ),),
              ),
            ],
          ),
          SizedBox(height: 7.5,),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(home_odds),
              ),
              Expanded(
                child: Text(draw_odds),
              ),
              Expanded(
                child: Text(away_odds),
              ),
            ],
          ),
          SizedBox(height: 7.5,),
          Text("Pick: ${prediction} | ${prediction_odds}"),
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