import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/screens/principal.dart';
import 'package:tp_uber/widgets/custom_text_field.dart';
class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int balance=0;
  TextEditingController rechargeController= TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Wallet',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width*0.95,
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                    Text('Balance:', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.white),),
                    Text('CFA ${balance}', style: TextStyle(fontWeight: FontWeight.w800,fontSize: 40,color: Colors.white),),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (BuildContext context) => recharge(context),
                      );
                    }, child: Text('Deposit'))
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget recharge(BuildContext context){
    return AlertDialog(
      title: Text('Recharge'),
      content: Container(
        height: 125,
        child: Column(
          children: [
            CustomTextField('Entrez un montant:',rechargeController,'250',Icon(Icons.money),false),
            ElevatedButton(onPressed: (){
              /*setState(() {
                widget.balance+= int.parse(rechargeController.text.toString());
              });*/
              setbalance();
              Navigator.of(context).pop();
            }, child: Text('Deposit'))
          ],
        ),
      ),
    );
  }

  setbalance() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int initialValue = await prefs.getInt('balance')?? 0;
    await prefs.setInt('balance',initialValue+ int.parse(rechargeController.text));
    setState(() {
      balance=initialValue + int.parse(rechargeController.text);
    });
  }
}
