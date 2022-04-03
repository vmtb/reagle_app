import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/constant.dart';
import 'package:tp_uber/models/api_response.dart';
import 'package:tp_uber/screens/principal.dart';
import 'package:tp_uber/screens_driver/create_driver.dart';
import 'package:tp_uber/screens_driver/principal_d.dart';
import 'package:tp_uber/services/user_services.dart';


class splash_screen_d extends StatefulWidget {
  const splash_screen_d({Key? key}) : super(key: key);

  @override
  _splash_screen_dState createState() => _splash_screen_dState();
}

class _splash_screen_dState extends State<splash_screen_d> {
  void loadDriverInfo() async{
    String did = await getDriverid();
    print('*\n\n\n****${did}****\n\n\n');
    if (did=='') {
      print('null Driver id..........................................................');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateDriver()));
    } else{
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => PrincipalD()),(route)=>false);
    }
  }

  @override

  void initState(){
    loadDriverInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('TP-Uber\n Driver mode',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),),
          CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
