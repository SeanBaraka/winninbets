import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class LatestFixture extends StatelessWidget {
  final bool isVip;
  final home_team,away_team, date, prediction, prediction_odds, home_odds, draw_odds, away_odds;
  const LatestFixture({
    Key key, this.home_team, this.isVip, this.away_team, this.date, this.prediction, this.prediction_odds, this.home_odds, this.draw_odds, this.away_odds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DateFormat('d MMM, yyyy').format(DateTime.parse(date)), style: TextStyle(
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
                child: Text("VS", style: TextStyle(
                  fontSize: 12
                ),),
              ),
              Expanded(
                child: Text(away_team, style: TextStyle(
                    fontWeight: FontWeight.w900
                ),),
              ),
              isVip ? Expanded(
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/ic_vip.svg', width: 14,),
                    Text('vip', style: TextStyle(
                        fontSize: 12,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ) : Container(),
            ],
          ),
          SizedBox(height: 7.5,),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(home_odds, style: TextStyle(
                  fontSize: 13,
                ),),
              ),
              Expanded(
                child: Text(draw_odds, style: TextStyle(
                    fontSize: 13,
                ),),
              ),
              Expanded(
                child: Text(away_odds, style: TextStyle(
                    fontSize: 13
                ),),
              ),
            ],
          ),
          SizedBox(height: 7.5,),
          Text("Pick: ${prediction} | ${prediction_odds}",  style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900
          ),),
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