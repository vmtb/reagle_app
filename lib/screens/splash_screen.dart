import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/constant.dart';
import 'package:tp_uber/models/api_response.dart';
import 'package:tp_uber/screens/principal.dart';
import 'package:tp_uber/services/user_services.dart';
import './login.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  void loadUserInfo() async{
    String uid = await getUid();
    if (uid=='') {
      print('null uid..........................................................');
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Login()),(route)=>false);
    } else{
      ApiResponse response = await getUserDetails();
      if(response.error==null){
        var data = await getUser();
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => Principal(data)),(route)=>false);
      } else if (response.error== unauthorized){
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => Login()),(route)=>false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}')
        ));
      }
    }
  }

  @override

  void initState(){
    loadUserInfo();
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
              Text('TP-Uber',style: TextStyle(
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
