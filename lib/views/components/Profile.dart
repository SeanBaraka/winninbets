import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/controller/AuthController.dart';
import 'package:winninbets/views/components/LinkLabel.dart';
import 'package:winninbets/views/components/Subscribe.dart';
import 'package:winninbets/views/screens/LoginScreen.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    data['is_vip'] == true ? Text("VIP Member", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22
                  ),) : Text('Regular Member',style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22)),
                    SizedBox(height: 10,),
                    Text('${data['first_name']}\t${data['last_name']}', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 10,),
                    Text("Phone Number: \t${data['telephone']}",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),),
                    SizedBox(height: 5,),
                    Text("Location: \t${data['location']}",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),),
                    SizedBox(height: 20,),

                    SizedBox(height: 10,),
                    data['is_vip'] ==true ? Text("Activated: on ${data['made_vip']}", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: clrSuccess
                    ),) : Subscribe(),
                    data['is_vip'] == true ? SizedBox(height: 40,) : SizedBox(height: 0,),
                    Text("Refer Friends to get\ndiscounted VIP prices", style: TextStyle(
                        fontSize: 16
                    ),),
                    SizedBox(height: 10,),
                    Text("Friends referred", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),),
                    Text(data['referrals'].toString(),style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 56
                    ),),
                    SizedBox(height: 20,),
                    Text("Referral link", style: TextStyle(
                        fontSize: 16
                    ),),
                    LinkLabel(labelText: "http://winninbets.co.ke/referral/${data['referral_code']}",),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.34,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: FlatButton(
                          padding: EdgeInsets.only(left: 25),
                          color: Colors.black12,
                          onPressed: () {  },
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/ic_copy.svg'),
                              SizedBox(width: 10,),
                              Text("Copy Link")
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: FlatButton(
                          padding: EdgeInsets.only(left: 25),
                          color: Colors.black12,
                          onPressed: () {
                            var deleteToken = logout();
                            if(deleteToken != null) {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (Route<dynamic> route) => false);
                            }
                          },
                          child: Row(
                            children: <Widget>[
                              Text("Logout")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2,),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
