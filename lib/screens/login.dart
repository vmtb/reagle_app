import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp_uber/models/api_response.dart';
import 'package:tp_uber/models/user.dart';
import 'package:tp_uber/screens/pwd_reset.dart';
import 'package:tp_uber/screens/register.dart';
import 'package:tp_uber/widgets/custom_text_field.dart';
import 'principal.dart';
import 'package:http/http.dart' as http;
import 'package:tp_uber/ids.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/api/call_api.dart';
import 'package:tp_uber/services/user_services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  String logButton='Se connecter';
  void  LogUser() async{
     String phoneNumber = phoneController.text;
     String password =  pwdController.text;

    ApiResponse response = await login(phoneNumber, password);
    if(response.error==null){
      saveAndRedirectUid(response.uid as String);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error} ')));
    }


  }

  void saveAndRedirectUid(String uid) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('*****************************************************************');
    await pref.setString('uid', uid ?? '');
    var data= await getUser();
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => Principal(data)),(route)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Connexion',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.5,
                  margin: EdgeInsets.all(50),
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          CustomTextField('Téléphone', phoneController,
                              'Entrez votre nom', Icon(Icons.person),false),
                          CustomTextField('Mot de passe', pwdController,
                              '*******', Icon(Icons.password),true),
                          ElevatedButton(
                                  onPressed: () async{
                                if(phoneController.text.isEmpty || pwdController.text.isEmpty){

                                }
                                setState(() {
                                  logButton='chargement...';
                                });
                                LogUser();

                              },
                              child: Text(logButton)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: Text(
                                    'S\'inscrire',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PwdReset()));
                                  },
                                  child: Text(
                                    'Mot de passe oublié',
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }


}
