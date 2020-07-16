import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/views/components/LinkLabel.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Remember to stay \nsafe during these \ndifficult times", style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 20,),
              Text("Sean Baraka", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10,),
              Text("Email Address: \tseanbaraka@gmail.com", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),),
              SizedBox(height: 5,),
              Text("Phone Number: \t+254 752233532",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
              SizedBox(height: 5,),
              Text("Location: \tMachakos, Kenya",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
              SizedBox(height: 20,),
              Text("VIP Member", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22
              ),),
              SizedBox(height: 10,),
              Text("Activated: 5-08-2020 ~25 days remaining", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: clrSuccess
              ),),
              SizedBox(height: 40,),
              Text("Refer Friends to get\ndiscounted VIP prices", style: TextStyle(
                  fontSize: 16
              ),),
              SizedBox(height: 10,),
              Text("Friends referred", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18
              ),),
              Text("12",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 56
              ),),
              SizedBox(height: 20,),
              Text("Referral link", style: TextStyle(
                  fontSize: 16
              ),),
              LinkLabel(labelText: "http://winninbets.co.ke/FE2123",),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
