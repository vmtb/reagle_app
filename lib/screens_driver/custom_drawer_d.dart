
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/screens/principal.dart';
import 'package:tp_uber/screens/settings.dart';
import 'package:tp_uber/screens/wallet.dart';
import 'package:tp_uber/screens_driver/orders_d.dart';
import 'package:tp_uber/services/user_services.dart';

class CustomDrawerD extends StatefulWidget {
  @override
  State<CustomDrawerD> createState() => _CustomDrawerDState();
}

class _CustomDrawerDState extends State<CustomDrawerD> {
  bool switchValue=true;
  int? balance;

  buildMenuItem(
      @required String name,
      @required IconData icon,
      @required BuildContext context,
      @required Page) {
    return ListTile(
        leading: Icon(icon),
        title: Text(name),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Page));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.amber[50],
        child: Stack(
            children:[
              Opacity(opacity: 1),
              ListView(
                children: [
                  Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Switch(value: switchValue, onChanged: (value) async {
                              setState(){
                                switchValue=value;
                              };
                              var data = await getUser();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Principal(data)));
                            }),
                            Text('Driver mode', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                          ],
                        ),
                        Text('Bienvenue dans Tp-Uber',style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ),
                  buildMenuItem('Wallet', Icons.account_balance_wallet, context, Wallet()),
                  buildMenuItem('Orders', Icons.list, context, OrdersD()),
                  buildMenuItem('Settings', Icons.settings,context,Settings()),

                ],
              ),
            ]
        ),
      ),
    );
  }

  getBalance()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() async {
      balance= await prefs.getInt('balance');
    });
  }
}
