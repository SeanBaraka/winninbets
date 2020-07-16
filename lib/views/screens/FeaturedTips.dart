import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/controller/TipsController.dart';
import 'package:winninbets/views/components/InputBox.dart';
import 'package:winninbets/views/components/LatestFixture.dart';
import 'package:http/http.dart' as http;

class FeaturedTips extends StatelessWidget {
  var date = DateTime.now();
  var response = getTips();

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
                    Text("Today ${date}", style: TextStyle(
                      fontSize: 14
                    ),),
                    Text("Premier League"),
                    SizedBox(height: 30,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/wolves.png'),
                              Text("Wolves", style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                              ),)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text("1930 hrs"),
                              Text("vs"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Image.asset("assets/images/arsenal.png"),
                              Text("Arsenal",style: TextStyle(
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
                    Text("Home Win | 1.24", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: FutureBuilder(
                  future: getTips(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return LatestFixture();
                        });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Today"),
                      Column(
                        children: <Widget>[
                          LatestFixture(),
                          LatestFixture(),
                          LatestFixture()
                        ],
                      )
                    ],
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
                                Text("3.40", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900
                                ),)
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
                                    DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("KES"),
                                        ),
                                        DropdownMenuItem(
                                          child: Text("USD"),
                                        )
                                      ], onChanged: (value) {  },
                                    ),
                                    Container(
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
                          Text("Place a bet and win", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),),
                          SizedBox(height: 5,),
                          Text("Ksh. 340", style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                          ),)
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


