import 'package:flutter/material.dart';
import 'package:tp_uber/screens_driver/order_info_d.dart';
import 'package:tp_uber/widgets/custom_text_field.dart';


class CourseEndD extends StatelessWidget {

  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width * 0.99,
          height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.all(50),
          child: Opacity(
            opacity: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Votre Client à un code qui permet de confirmer la fin de la course'),
                  SizedBox(
                    height: 80,
                  ),
                  CustomTextField('Entrez le code', codeController,
                      '0635', Icon(Icons.confirmation_num),false),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderInfoD()));
                      },
                      child: Text('Terminer')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
