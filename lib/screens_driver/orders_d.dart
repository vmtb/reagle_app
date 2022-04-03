import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_uber/models/driver.dart';
import 'package:tp_uber/screens_driver/order_info_d.dart';
import 'package:tp_uber/screens_driver/order_selection.dart';

class OrdersD extends StatefulWidget {


  @override
  _OrdersDState createState() => _OrdersDState();
}
TextStyle titleStyle= TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
List<Driver> drivers = [Driver(firstName: 'AGOSSADOU',surname: 'Guérin',email: 'agossadourin@gmail.com',availableBalance: 120,licensePlateNumber:'2CT0616',id: '0x3645',password: '1111',phone: '67894105',pricePropostion: 112,rate: 4,vehiculeType: 0),
  Driver(firstName: 'AGOSSADOU',surname: 'Guérin',email: 'agossadourin@gmail.com',availableBalance: 120,licensePlateNumber:'2CT0616',id: '0x3645',password: '1111',phone: '67894105',pricePropostion: 112,rate: 4,vehiculeType: 0),
  Driver(firstName: 'AGOSSADOU',surname: 'Guérin',email: 'agossadourin@gmail.com',availableBalance: 120,licensePlateNumber:'2CT0616',id: '0x3645',password: '1111',phone: '67894105',pricePropostion: 112,rate: 4,vehiculeType: 0)
];

class _OrdersDState extends State<OrdersD> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Orders'),
        ),
        body: ListView.builder(
            itemCount: drivers.length,
            itemBuilder: (context, index){
              return ListTile(

                leading: Icon(Icons.directions_car_sharp),
                title: Text('Trajet:', style: titleStyle,),
                subtitle: Text('Date:', style: titleStyle,),
                trailing: Text('pending...',style: TextStyle(color: Colors.red),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderInfoD()));
                },
              );
            })
    );
  }
}
