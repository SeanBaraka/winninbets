import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/models/Prediction.dart';
import 'package:winninbets/controller/TipsController.dart';

class Archives extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: getTips(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                          color: clrBg,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                offset: Offset(0,0)
                            )
                          ]
                      ),
                      child: new ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(top: 20, left: 10),
                          child: (snapshot.data[index]['status'] != null) ? SvgPicture.asset('assets/icons/ic_check.svg', width: 15,): SvgPicture.asset('assets/icons/ic_clock.svg', width: 20,),
                        ),
                        title:  Container(
                          margin: EdgeInsets.only(top: 18),
                          child: Row(
                            children: <Widget>[
                              Expanded(child: Text(snapshot.data[index]['home_team'], style: TextStyle(
                                  fontWeight: FontWeight.w700
                              ),),),
                              Expanded(child: Text("vs"),),
                              Expanded(child: Text(snapshot.data[index]['away_team'], style: TextStyle(
                                  fontWeight: FontWeight.w700
                              ),))
                            ],
                          ),
                        ),
                        subtitle: Column(
                            children:<Widget>[
                              SizedBox(height: 8.5,),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("Pick: ${snapshot.data[index]['prediction']} | ${snapshot.data[index]['prediction_odds']}", style: TextStyle(
                                      color: snapshot.data[index]['status'] == null ? clrPending : snapshot.data[index]['status'] == 'won' ? clrSuccess : clrDanger,
                                      fontWeight: FontWeight.w700
                                  ),)),
                                  SizedBox(width: 5,),
                                  Expanded(child: snapshot.data[index]['result'] != null ? Text("Score: \t ${snapshot.data[index]['result']}",style: TextStyle(
                                      color: snapshot.data[index]['status'] !=null ? clrSuccess : clrDanger,
                                      fontWeight: FontWeight.w700
                                  )): Text("Score: \tTBA", style: TextStyle(
                                    color: clrPrimary,
                                    fontWeight: FontWeight.w700
                                  ),))
                                ],
                              ),
                            ]
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(strokeWidth: 2,),
                );
              }
            }
          )
        ),
    );
  }
}
