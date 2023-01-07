import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_uber/screens/mission_end_2.dart';


class MissionEnd extends StatefulWidget {
  const MissionEnd({Key? key}) : super(key: key);

  @override
  _MissionEndState createState() => _MissionEndState();
}

class _MissionEndState extends State<MissionEnd> {


  @override

  void initState(){
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
              MissionEnd2()),
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 200,),
              Text('Mission en cours...',style: TextStyle(
                color: Colors.black,
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
