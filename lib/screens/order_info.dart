import 'package:flutter/material.dart';
import 'package:tp_uber/models/driver.dart';
import 'package:tp_uber/screens/course_end.dart';
import 'package:tp_uber/screens/principal.dart';
import 'package:tp_uber/screens/rate.dart';
import 'package:tp_uber/screens/wallet.dart';

import '../services/user_services.dart';

class OrderInfo extends StatelessWidget {
  String? orderId;
  String? trajet;
  String? date;
  String? orderStatus;
  int? way;
  OrderInfo({@required this.orderId,@required this.trajet,@required this.date, @required this.orderStatus, @required this.way});

  Driver driverOne= Driver(firstName: 'AGOSSADOU',surname: 'Guérin',email: 'agossadourin@gmail.com',availableBalance: 120,licensePlateNumber:'2CT0616',id: '0x3645',password: '1111',phone: '67894105',pricePropostion: 112,rate: 4,vehiculeType: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width*0.95,
          height: MediaQuery.of(context).size.height*0.4,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Id: ${this.orderId}'),
              Text('Trajet: ${this.trajet}'),
              Text('Chauffeur: ${driverOne.firstName} ${driverOne.surname}'),
              Text('N de plaque: ${driverOne.licensePlateNumber}'),
              Text('Tel: ${driverOne.phone}'),
              Text('Note: pas encore défini'),
              Text('Tarif: ${this.trajet}'),
              Text('Statut de la course: En cours..'),
              SizedBox(height: 10,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>CourseEnd()),(route)=>false);
                      },
                      child: Text('Terminer la course'),
                    ),
                    ElevatedButton(
                      onPressed: ()async{
                        var data= await getUser();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Principal(data)));
                      },
                      child: Text('Retour'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
