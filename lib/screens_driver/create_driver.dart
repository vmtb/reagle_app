
import 'package:flutter/material.dart';
import 'package:tp_uber/screens_driver/principal_d.dart';

import '../services/user_services.dart';
import '../widgets/custom_text_field.dart';

class CreateDriver extends StatefulWidget {
  const CreateDriver({Key? key}) : super(key: key);

  @override
  State<CreateDriver> createState() => _CreateDriverState();
}

class _CreateDriverState extends State<CreateDriver> {
  TextEditingController licensePlateController = new TextEditingController();
  bool checkVal= false;
  int vehicleType = 0;

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
                  'Driver profile creation',
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
                          CustomTextField('License Plate number', licensePlateController,
                              'Entrez le n de place du vehicule', Icon(Icons.electric_bike),false),
                          Text('Cochez cette case si votre véhicule est de type voiture. Laissez si c\'est une moto'),
                          Checkbox(
                              value: checkVal,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkVal=value!;
                                  if(value==true){vehicleType=1;} else{vehicleType=0;}
                                });
                              }),
                          ElevatedButton(
                              onPressed: () async{
                                if(licensePlateController.text.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please enter license plate number')));
                                }
                                bool driverProfile = await createDriverPofile(licensePlateController.text,vehicleType);
                                if(driverProfile==true){
                                  Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(builder: (context) => PrincipalD()),(route)=>false);
                                }else{ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('error creating Driver profile ')));}
                              },
                              child: Text('Create Driver Profile')),
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
