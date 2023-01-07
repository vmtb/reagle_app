import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_uber/screens/principal.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {


  @override

  void initState(){
    //loadUserInfo();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Principal()),
            )
        );
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
              SizedBox(height: 400,),
              Text('REAGLE',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),),
              Text('Just choose your destination \n and let the drone do the rest',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),),
          CircularProgressIndicator(),
              Text('Waiting for drone connection...',style: TextStyle(color: Colors.white),)

            ],
          ),
        ),
      ),
    );
  }
}
