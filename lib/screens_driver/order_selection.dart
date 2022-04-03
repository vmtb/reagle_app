import 'package:flutter/material.dart';
import 'package:tp_uber/models/driver.dart';
import 'package:tp_uber/screens_driver/orders_d.dart';

class OrderSelection extends StatelessWidget {

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
              Text('Nom et prenom:'),
              Text('N de plaque'),
              Text('Tel:'),
              Text('Note'),
              Text('Tarif proposé:'),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (BuildContext context)=> Notif(context)
                    );
                   },
                  child: Text('Prendre la course '),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
  Widget Notif(BuildContext context){
    return AlertDialog(
      title: Text('Notification'),
      content: Container(
        height: 125,
        child: Column(
          children: [
            Text('La course a été enregistrée sur votre compte. Consultez son évolution dans vos ordres'),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrdersD()));
            }, child: Text('OK'))
          ],
        ),
      ),
    );
  }
}
