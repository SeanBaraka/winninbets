import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winninbets/constants/ApiUrl.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:http/http.dart' as http;
import 'package:winninbets/controller/AuthController.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({
    Key key,
  }) : super(key: key);

  @override
  _SubscribeState createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  static const String iapId = 'android.winninbets.purchased';
  List<IAPItem> _items = [];

  @override
  void initState() {
    super.initState();
    getSubscriptionKey(iapId);
    initPlatformState();
  }

  void getSubscriptionKey(String key) async {
    // Prepare the connection to the IAP service.
    var startConnection = await FlutterInappPurchase.instance.initConnection;
    print('start connection $startConnection');
  }


  Future<void> initPlatformState() async {
   // Get all IAP products and subscriptions
    await _getProduct();
  }

  Future<Null> _getProduct() async {
    print('getting items ');
    List<IAPItem> items = await FlutterInappPurchase.instance.getSubscriptions([iapId]);
    print('items $items');
    for (var item in items) {
      print('${item.toString()}');
      this._items.add(item);
    }

    setState(() {
      this._items = items;
    });
  }

  Future<Null> _buyProduct(IAPItem item) async {
    try {
      PurchasedItem purchased =
      await FlutterInappPurchase.instance.requestPurchase(item.productId);
      print(purchased);
      String msg = await FlutterInappPurchase.instance.consumeAllItems;
      print('consumeAllItems: $msg');

      var someData = await getUser();
      var userId = someData['id'];

      var userData = {
        'id': userId,
        'isVip': true
      };
      var jsonData = json.encode(userData);
      var response = await http.put('${ApiUrl}users/makevip/', body: jsonData);

      print(json.decode(response.body));

    } catch (error) {
      print('$error');
    }
  }

  List<Widget> _renderButton() {
    List<Widget> widgets = this
        ._items
        .map(
          (item) => Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Subscribe to VIP now", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: RaisedButton(
                      color: clrSuccess,
                      onPressed: () {
                        _buyProduct(item);
                      },
                      child: Text("Subscribe to VIP ${item.localizedPrice}", style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          )
    )
        .toList();
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _renderButton(),
    );
  }

}