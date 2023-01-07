import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_uber/screens/principal.dart';


class MissionEnd2 extends StatefulWidget {
  const MissionEnd2({Key? key}) : super(key: key);

  @override
  _MissionEnd2State createState() => _MissionEnd2State();
}

class _MissionEnd2State extends State<MissionEnd2> {


  @override

  void initState(){
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
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 200,),
              Text('Your mission is done!',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
