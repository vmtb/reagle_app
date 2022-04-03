import 'package:flutter/material.dart';
import 'package:tp_uber/models/driver.dart';
import 'package:tp_uber/screens_driver/course_end_d.dart';
import 'package:tp_uber/screens_driver/rate_d.dart';

class OrderInfoD extends StatelessWidget {

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
              Text('Trajet:'),
              Text('Nom et prenom:'),
              Text('N de plaque'),
              Text('Tel:'),
              Text('Note'),
              Text('Tarif:'),
              Text('Statut de la course:'),
              SizedBox(height: 10,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RateD()));
                      },
                      child: Text('Noter'),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CourseEndD()));
                         },
                      child: Text('Terminer la course'),
                    ),
                    ElevatedButton(
                      onPressed: (){
                      },
                      child: Text('Annuler'),
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
