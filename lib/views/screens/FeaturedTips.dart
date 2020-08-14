import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:winninbets/constants/ApiUrl.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/controller/TipsController.dart';
import 'package:winninbets/views/components/InputBox.dart';
import 'package:winninbets/views/components/LatestFixture.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class FeaturedTips extends StatefulWidget {
  @override
  _FeaturedTipsState createState() => _FeaturedTipsState();
}

class _FeaturedTipsState extends State<FeaturedTips> {

  var date = DateTime.now();

  var response = getTips();

  var totalOdds = "";

  var winAmount = 0;

  int selectedCurrency = 0;

  var currencies = <DropdownMenuItem> [
    DropdownMenuItem(
      child: Text("KES"),
      value: 'KES',
    ),
    DropdownMenuItem(
      child: Text("USD"),
      value: 'USD',
    ),
    DropdownMenuItem(
      child: Text("EUR"),
      value: 'EUR',
    ),
    DropdownMenuItem(
      child: Text("UGX"),
      value: 'UGX',
    ),
    DropdownMenuItem(
      child: Text("TZS"),
      value: 'TZS',
    ),
    DropdownMenuItem(
      child: Text("ZMW"),
      value: 'ZMW',
    ),
    DropdownMenuItem(
      child: Text("GHS"),
      value: 'GHS',
    ),
  ];

  Future<String> getTotalOdds() async {
    var response = await http.get('${ApiUrl}tips/odds');
    totalOdds = response.body;

    return response.body;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text("Featured Match", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26
                    ),),
                    Text("Today ${DateFormat('d MMM, yyyy').format(date)}", style: TextStyle(
                      fontSize: 14
                    ),),
                    SizedBox(height: 30,),
                    FutureBuilder(
                      future: getFeatured(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data[0];
                          return Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text('Home'),
                                        Text(data['home_team'], style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(DateFormat('d-MMM-yy H:mm').format(DateTime.parse(data['match_date']))),
                                        Text("vs"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text("Away"), // Use Logo and not just some weird name
                                        Text(data['away_team'],style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700
                                        ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text("Pick", style: TextStyle(
                                  fontSize: 16
                              ),),
                              SizedBox(height: 5,),
                              Text("${data['prediction']} | ${data['prediction_odds']}", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700
                              ),)
                            ],
                          );
                        } else {
                          return Container(
                            width: 20,
                            height: 20,
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 1,),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: clrBg,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0,0)
                    )
                  ]
                ),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: FutureBuilder(
                    future: getRecent(),
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return LatestFixture(
                                isVip: data[index]['is_vip_tip'],
                                home_team:data[index]['home_team'],
                                away_team:data[index]['away_team'],
                                date:data[index]['match_date'],
                                prediction:data[index]['prediction'],
                                prediction_odds:data[index]['prediction_odds'],
                                home_odds:data[index]['home_odds'],
                                draw_odds:data[index]['away_odds'],
                                away_odds:data[index]['draw_odds'],
                              );
                            });
                      } else {
                        return Container(
                          width: 20,
                          height: 20,
                          child: Center(
                            child: CircularProgressIndicator( strokeWidth: 2,),
                          ),
                        );
                      }
                    },
                  ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Total Odds", style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900
                                ),),
                                FutureBuilder(
                                  future: getTotalOdds(),
                                  builder: (context, snapshot){
                                    return Text(totalOdds, style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900
                                    ),);
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Enter Bet amount", style: TextStyle(
                                  fontWeight: FontWeight.w700
                                ),),
                                Row(
                                  children: <Widget>[
                                    ClipRect(
                                      child: DropdownButton(
                                        value: currencies[selectedCurrency].value,
                                        items: currencies,
                                        onChanged: (value) {
                                          // TODO: Change currencies
                                          setState(() {

                                            var item = currencies.where((element) => element.value == value).first;
                                            var index = currencies.indexOf(item);
                                            selectedCurrency = index;
                                          });
                                      },
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.25,
                                        height: 30,
                                        decoration: BoxDecoration(border: Border.all(color: clrLighter, width: 1, style: BorderStyle.solid)
                                        ),
                                        padding: EdgeInsets.only(left: 5),
                                        child: Container(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              setState(() {
                                                winAmount = int.parse(value);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 15,),
                          Text("Place a bet and win" ,style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),),
                          SizedBox(height: 5,),
                          totalOdds != null && totalOdds.isNotEmpty ? Text('${currencies[selectedCurrency].value} ${(winAmount* double.parse(totalOdds)).toString()}', style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                          ),) : Text("--", style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


