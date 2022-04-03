import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_uber/models/new_user.dart';
import 'package:tp_uber/screens/login.dart';
import 'package:tp_uber/services/user_services.dart';
import 'package:tp_uber/widgets/custom_text_field.dart';
import '../models/api_response.dart';
import '../models/user.dart';
import 'principal.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController surnameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController cpwdController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  String logButton='S\'inscrire';

  Future <int> CreateUser() async{
    var url='http://tpuberensgmm.repetiteursdunet.com/api/users';
    var data={
      "firstName": nameController.text,
      "lastName": surnameController.text,
      "phoneNumber": phoneController.text,
      "active": true,
      "password": pwdController.text,
      "gender": 0
    };
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(data) ,
      headers: {
      'Content-type':'application/json',
        'Accept':'application/json',
      }
    );
    return response.statusCode;
  }

  void  RegisterUser() async{
    String firstName =  nameController.text;
    String lastName= surnameController.text;
    String phoneNumber= phoneController.text;
    bool active = true;
    String password= pwdController.text;
    int gender= 0;

    ApiResponse response = await register(firstName,lastName, phoneNumber,active, password,gender);
    if(response.error==null){
      saveUid(response.data as User);
      bool userProfile= await createUserProfile( response.uid as String) ;
      if(userProfile==true){
        var data = await getUser();
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => Principal(data)),(route)=>false);
      }else{ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('error creating userprofile ')));}
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error} ')));
    }


  }

  void saveUid(User user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('uid', user.id ?? '');
  }

  Future<bool> createUserProfile( String? uid) async{
    bool success = await createClientPofile();
    return success;
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
                  height: 30,
                ),
                Text(
                  'Inscription',
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
                  height: MediaQuery.of(context).size.height * 0.65,
                  margin: EdgeInsets.all(50),
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          CustomTextField('Nom', nameController,
                              'Entrez votre nom', Icon(Icons.person),false),
                          CustomTextField('Prénom', surnameController,
                              'Entrez votre prénom', Icon(Icons.person),false),
                          CustomTextField('Tel', phoneController,
                              'Entrez votre numéro de tel', Icon(Icons.phone),false),
                          CustomTextField('Mot de passe', pwdController,
                              '*******', Icon(Icons.password),true),
                          CustomTextField('Confirmer le mot de passe',
                              cpwdController, '*******', Icon(Icons.password),true),
                          ElevatedButton(

                            onPressed: () async{
                              if(nameController.text.isEmpty || surnameController.text.isEmpty || phoneController.text.isEmpty || pwdController.text.isEmpty || pwdController.text !=cpwdController.text){

                              }
                              setState(() {
                                logButton='chargement...';
                              });

                              RegisterUser();
                              /*int a = await CreateUser();
                              print(a);
                              if(a==201){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Principal()));
                              }
                              else{
                                setState(() {
                                  logButton='Erreur..réessayez';
                                });
                              }*/

                            },
                            child: Text(logButton),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(color: Colors.black),
                              ))
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
