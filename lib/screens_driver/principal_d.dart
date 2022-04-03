import 'package:flutter/material.dart';
import 'package:tp_uber/models/order.dart';
import 'package:tp_uber/screens_driver/custom_drawer_d.dart';
import 'package:tp_uber/screens_driver/order_info_d.dart';
import 'package:tp_uber/screens_driver/order_selection.dart';

class PrincipalD extends StatefulWidget {
  const PrincipalD({Key? key}) : super(key: key);

  @override
  _PrincipalDState createState() => _PrincipalDState();
}

class _PrincipalDState extends State<PrincipalD> {

  List  ordersList = [0,1,2];
  TextStyle titleStyle= TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Available courses', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      drawer: CustomDrawerD(),
      body: ListView.builder(
                itemCount: ordersList.length,
                itemBuilder: (context, index){
                  return ListTile(

                    leading: Icon(Icons.directions_car_sharp),
                    title: Text('Trajet:', style: titleStyle,),
                    subtitle: Text('Date:', style: titleStyle,),
                    trailing: Text('pending...',style: TextStyle(color: Colors.red),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderSelection()));
                    },
                  );
                })



    );
  }
}
