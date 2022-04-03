import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {

  String name;
  String htext;
  Icon ics;
  TextEditingController tcontroller;
  bool obscure;
  CustomTextField(@required this.name, @required this.tcontroller, @required this.htext, @required this.ics, @required this.obscure);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.name,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width*0.6,
          height: MediaQuery.of(context).size.height*0.04,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextFormField(
            obscureText: this.obscure,
            controller: tcontroller,
            decoration: InputDecoration(
              icon: this.ics,
              hintText: this.htext,
              hintStyle:TextStyle(color: Colors.white54) ,

            ),
          ),
        ),
      ],
    );
  }
}
