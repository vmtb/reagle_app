import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_uber/screens/mission_end_2.dart';


class MissionEnd extends StatefulWidget {
  final String position;
  const MissionEnd({Key? key, required this.position}) : super(key: key);

  @override
  _MissionEndState createState() => _MissionEndState();
}

class _MissionEndState extends State<MissionEnd> {


  @override

  void initState(){
    Timer(const Duration(seconds: 6),
            ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
                MissionEnd2( position: widget.position,)),
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Mission execution in progress...',
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,

              ), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
