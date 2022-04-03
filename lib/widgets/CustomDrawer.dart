
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_uber/screens/login.dart';
import 'package:tp_uber/screens/orders.dart';
import 'package:tp_uber/screens/settings.dart';
import 'package:tp_uber/screens/wallet.dart';
import 'package:tp_uber/screens_driver/principal_d.dart';
import 'package:tp_uber/ids.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/screens_driver/splash_screen_d.dart';
import 'package:tp_uber/services/user_services.dart';

class CustomDrawer extends StatefulWidget {
  var data;
  CustomDrawer(@required this.data);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool switchValue=false;

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
  buildWalletItem(
      @required String name,
      @required IconData icon,
      @required BuildContext context,
      @required Page) async{
    return ListTile(
        leading: Icon(icon),
        title: Text(name),
        onTap: () {
          setState(() async{
            balance = await getBalance();
          });
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
                          Switch(value: switchValue, onChanged: (value){
                            setState(){
                              switchValue=value;
                            };
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>splash_screen_d()));
                          }),
                          Text('Driver mode', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                        ],
                      ),
                      Text('Bienvenue ${widget.data['firstName']} ',style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Colors.white
                      ),),
                    ],
                  ),
                ),
                buildMenuItem('Wallet', Icons.account_balance_wallet, context, Wallet()),
                buildMenuItem('Orders', Icons.list, context, Orders()),
                buildMenuItem('Settings', Icons.settings,context,Settings()),
                TextButton(onPressed: ()async{
                  logout();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false);
                }, child: Text('Logout')),

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
      balance= await prefs.getInt('balance')?? 0;
    });
  }
}
