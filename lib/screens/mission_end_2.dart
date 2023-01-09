import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tp_uber/screens/principal.dart';


class MissionEnd2 extends StatefulWidget {
  final String position;
  const MissionEnd2({Key? key, required this.position}) : super(key: key);

  @override
  _MissionEnd2State createState() => _MissionEnd2State();
}

class _MissionEnd2State extends State<MissionEnd2> {


  @override

  void initState(){
    Timer(const Duration(seconds: 5),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            SizedBox(
              height: 80,
              child: Center(
                  child: Image.asset(
                    '$kImagePath/icon_success.png',
                    package: 'rflutter_alert',
                  )),
            ),
            const SizedBox(height: 80,),
            const Text('Your mission is done!',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),),
            const SizedBox(height: 5,),
            Text('The drone successfully landed at ${widget.position}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),),
            const SizedBox(height: 10,),
            const Text('(The report have been sent to your email)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),),


          ],
        ),
      ),
    );
  }
}
