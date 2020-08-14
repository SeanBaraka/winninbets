import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/models/Prediction.dart';
import 'package:winninbets/controller/TipsController.dart';
import 'package:intl/intl.dart';

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
                    var reversedIndex = snapshot.data.length - 1 - index;
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      constraints: BoxConstraints(minHeight: 90),
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
                          child: (snapshot.data[reversedIndex]['status'] == true) ? SvgPicture.asset('assets/icons/ic_check.svg', width: 15,) : (snapshot.data[reversedIndex]['status'] == false) ? SvgPicture.asset('assets/icons/ic_cross.svg', width: 12,) : SvgPicture.asset('assets/icons/ic_clock.svg', width: 16,),
                        ),
                        trailing: snapshot.data[reversedIndex]['is_vip_tip'] == true ? Column(
                          children: <Widget>[
                            SvgPicture.asset('assets/icons/ic_vip.svg', width: 15,),
                            Text("vip", style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w700
                            ),)
                          ],
                        ) : SizedBox(),
                        isThreeLine: true,
                        title:  Container(
                          child: Text("Date: ${DateFormat('d MMM, yyyy').format(DateTime.parse(snapshot.data[reversedIndex]['match_date']))}", style: TextStyle(
                            fontSize: 11
                          ),)
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget>[
                              SizedBox(height: 4.5,),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text(snapshot.data[reversedIndex]['home_team'], style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width * 0.032
                                  ),),),
                                  Expanded(child: Text("vs"),),
                                  Expanded(child: Text(snapshot.data[reversedIndex]['away_team'], style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width * 0.032
                                  ),))
                                ],
                              ),
                              SizedBox(height: 4.5,),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("Pick: ${snapshot.data[reversedIndex]['prediction']} | ${snapshot.data[reversedIndex]['prediction_odds']}", style: TextStyle(
                                      color: snapshot.data[reversedIndex]['status'] == null ? clrPending : snapshot.data[reversedIndex]['status'] == true ? clrSuccess : clrDanger,
                                      fontWeight: FontWeight.w900,
                                      fontSize: MediaQuery.of(context).size.width * 0.030
                                  ),)),
                                  SizedBox(width: 5,),
                                  Expanded(child: snapshot.data[reversedIndex]['score'] != null ? Text("Score: \t ${snapshot.data[reversedIndex]['score']}",style: TextStyle(
                                      color: snapshot.data[reversedIndex]['status'] !=null && snapshot.data[reversedIndex]['status'] == true ? clrSuccess : clrDanger,
                                      fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width * 0.030
                                  )): Text("Score: \tTBA", style: TextStyle(
                                    color: clrPrimary,
                                    fontWeight: FontWeight.w700,
                                      fontSize: MediaQuery.of(context).size.width * 0.030
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
