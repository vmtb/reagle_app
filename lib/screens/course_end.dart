import 'package:flutter/material.dart';
import 'package:tp_uber/screens/order_info.dart';
import 'package:tp_uber/screens/rate.dart';
import 'package:tp_uber/widgets/custom_text_field.dart';


class CourseEnd extends StatelessWidget {

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
                  Text('Votre chauffeur à un code qui permet de confirmer la fin de la course(pour une simulation, entrer 12457)'),
                  SizedBox(
                    height: 80,
                  ),
                  CustomTextField('Entrez le code', codeController,
                      '0635', Icon(Icons.confirmation_num),false),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Rate()));
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
