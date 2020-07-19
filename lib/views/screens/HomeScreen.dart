import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/views/components/Archives.dart';
import 'package:winninbets/views/components/MenuItems.dart';
import 'package:winninbets/views/components/Profile.dart';
import 'package:winninbets/views/screens/FeaturedTips.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedItem = 1;

  void _changeView(int index) {
    setState((){
      _selectedItem = index;
    });
  }

  var _homeWidgets = <Widget>[
    MenuItems(),
    FeaturedTips(),
    Archives(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', width: MediaQuery.of(context).size.width * 0.40,),
        centerTitle: true,
        backgroundColor: clrBg,
        elevation: 0,
      ),
      body: Container(
        child: _homeWidgets.elementAt(_selectedItem),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: clrInactive,
        currentIndex: _selectedItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/ic_menu.svg', color: clrPrimary, width: 22,),
            title: Text('Menu'),
            icon: SvgPicture.asset('assets/icons/ic_menu.svg',color: clrInactive, width: 20,)
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/icons/ic_home.svg', color: clrPrimary, width: 22,),
            title: Text('Home'),
            icon: SvgPicture.asset('assets/icons/ic_home.svg', color: clrInactive, width: 20,)
          ),
          BottomNavigationBarItem(
            title: Text('Archives'),
            activeIcon: SvgPicture.asset('assets/icons/ic_grid.svg', color: clrPrimary, width: 27,),
            icon: SvgPicture.asset('assets/icons/ic_grid.svg', width: 25, color: clrInactive,)
          ),
          BottomNavigationBarItem(
              title: Text('Profile'),
              activeIcon: SvgPicture.asset('assets/icons/ic_user.svg', color: clrPrimary, width: 24,),
              icon: SvgPicture.asset('assets/icons/ic_user.svg', color: clrInactive, width: 22,)
          ),

        ],
        onTap: _changeView,
      ),
    );
  }
}
