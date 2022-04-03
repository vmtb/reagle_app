import 'package:flutter/material.dart';
import 'package:tp_uber/screens/register.dart';
import 'package:tp_uber/widgets/custom_text_field.dart';

class PwdResetTwo extends StatelessWidget {
  TextEditingController pwdController = TextEditingController();
  TextEditingController ConfirmPwdController = TextEditingController();

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
          width: MediaQuery.of(context).size.width * 0.98,
          height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.all(50),
          child: Opacity(
            opacity: 1,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  CustomTextField('Choisissez un nouveau mot de passe',
                      pwdController, ' ', Icon(Icons.password),true),
                  CustomTextField('Confirmez le mot de passe', pwdController,
                      ' ', Icon(Icons.password),true),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Register()));
                      },
                      child: Text('Envoyer')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
