import 'package:flutter/material.dart';
import 'pwd_reset_two.dart';
import 'package:tp_uber/widgets/custom_text_field.dart';

class PwdReset extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
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
          height: MediaQuery.of(context).size.height * 0.3,
          margin: EdgeInsets.all(50),
          child: Opacity(
            opacity: 1,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  CustomTextField('Entrez votre email', emailController,
                      'Exemple@gmail.com', Icon(Icons.mail),false),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PwdResetTwo()));
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
