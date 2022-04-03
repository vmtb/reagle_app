import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_uber/models/driver.dart';
import 'package:tp_uber/screens/order_info.dart';

class Orders extends StatefulWidget {
  String? orderId;
  String? trajet;
  String? date;
  String? orderStatus;
  int? way;
  Orders({@required this.orderId,@required this.trajet,@required this.date, @required this.orderStatus, @required this.way});

  @override
  _OrdersState createState() => _OrdersState();
}
TextStyle titleStyle= TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
List<Driver> drivers = [Driver(firstName: 'AGOSSADOU',surname: 'Guérin',email: 'agossadourin@gmail.com',availableBalance: 120,licensePlateNumber:'2CT0616',id: '0x3645',password: '1111',phone: '67894105',pricePropostion: 112,rate: 4,vehiculeType: 0),
  Driver(firstName: 'AGOSSADOU',surname: 'Guérin',email: 'agossadourin@gmail.com',availableBalance: 120,licensePlateNumber:'2CT0616',id: '0x3645',password: '1111',phone: '67894105',pricePropostion: 112,rate: 4,vehiculeType: 0),
  Driver(firstName: 'AGOSSADOU',surname: 'Guérin',email: 'agossadourin@gmail.com',availableBalance: 120,licensePlateNumber:'2CT0616',id: '0x3645',password: '1111',phone: '67894105',pricePropostion: 112,rate: 4,vehiculeType: 0)
];

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Orders'),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index){
            return ListTile(
              isThreeLine: true,
              leading: Icon(Icons.task_alt),
              title: Text('Id: ${widget.orderId}', style: titleStyle,),
              subtitle: Text('Trajet: ${widget.trajet}\tDate:${widget.date}', style: titleStyle,),
              trailing: Text(' Status: ${widget.orderStatus}',style: TextStyle(color: Colors.red),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderInfo(trajet: widget.trajet,orderId: widget.orderId,orderStatus: widget.orderStatus,date: widget.date,way: widget.way,)));
              },
            );
          })
    );
  }
}
