import 'package:flutter/material.dart';
import 'package:tp_uber/screens_driver/principal_d.dart';

class CustomAlertDialog extends StatelessWidget {
  String message;
  String title;
  String buttonText;
  CustomAlertDialog({@required this.title='',@required this.buttonText='', @required this.message='' });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Container(
        height: 125,
        child: Column(
          children: [
            Text(message),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text(buttonText))
          ],
        ),
      ),
    );
  }
}
