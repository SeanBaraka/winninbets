import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winninbets/constants/colors.dart';

class MenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Become a VIP Member", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10,),
              Text("VIP Subscription Includes", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),), SizedBox(height: 7,),
              Text("More Odds", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),), SizedBox(height: 7,),
              Text("Higher Chances of winning", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10,),
              Text("Subscribe now", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.75,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: RaisedButton(
                    color: clrSuccess,
                    onPressed: () {  },
                    child: Text("Subscribe to VIP \$15/m", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Contact Us", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => launch("https://wa.me/254774995600?text=I'm%20interested%20in%20getting%20vip%20tips%20"),
                        child: SvgPicture.asset('assets/icons/ic_whatsapp.svg')),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () => launch('https://facebook.com'),
                        child: SvgPicture.asset('assets/icons/ic_fb.svg')),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => launch('https://gmail.com'),
                        child: SvgPicture.asset('assets/icons/ic_gmail.svg')),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => launch('https://twitter.com'),
                        child: SvgPicture.asset('assets/icons/ic_twitter.svg')),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text("Click the icon below to join our telegram channel", style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),),
              SizedBox(height: 20,),
              InkWell(
                onTap: () => launch('https://t.me/suremaxbettips'),
                  child: SvgPicture.asset('assets/icons/ic_telegram.svg', width: 100,))
            ],
          ),
        ),
      ),
    );
  }
}
