import 'package:flutter/material.dart';
import 'package:tp_uber/screens/orders.dart';
import 'package:tp_uber/screens/wallet.dart';
import 'package:tp_uber/services/user_services.dart';
class TransportWay extends StatefulWidget {
  String? orderId;
  String? trajet;
  String? date;
  String? orderStatus;
  String? distance;
  List? prices;
  TimeOfDay? startTime;
  TransportWay({@required this.orderId,@required this.trajet,@required this.date, @required this.orderStatus,@required this.distance, @required this.prices, @required this.startTime});

  @override
  _TransportWayState createState() => _TransportWayState();
}

class _TransportWayState extends State<TransportWay> {
  int way=0;
  bool? val;
  bool? vall;
  var balance;
  void initState(){
    checkBalance();
    super.initState();
  }
  void checkBalance()async{

   setState(() async{
     balance=await getbalance();
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                SizedBox(height: 10,),
                Text('distance: ${widget.distance} Km',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 10,),
                Text('Choississez le moyen qui vous convient',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () async{
                      checkBalance();
                      if(balance<widget.prices![0]){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${'Solde insuffisant, rechargez le portefeuille'} ')));
                        alertBalance();
                        actualisebalance(balance-widget.prices![0]);
                      }else{
                        showDialog(context: context, builder: (BuildContext context)=>alert(context));
                      }
                    },
                    child: Text('Tarif moto:\t\t ${widget.prices![0]} FCFA')),
                SizedBox(height: 5,),
                ElevatedButton(
                    onPressed: () async{
                       checkBalance();
                      if(balance<widget.prices![1]){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${'Solde insuffisant, rechargez le portefeuille'} ')));
                        alertBalance();
                        actualisebalance(balance-widget.prices![1]);
                      }else{
                        showDialog(context: context, builder: (BuildContext context)=>alert(context));
                      }
                      },
                    child: Text('Tarif auto:\t\t ${widget.prices![1]} FCFA')),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget alert(BuildContext context){
    return AlertDialog(
      title: Text('Recharge'),
      content: Container(
        height: 125,
        child: Column(
          children: [
            Text('Votre demande a été prise en compte. Vous pouvez suivre sa progression dans vos ordres.'),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders(date: DateTime.now().toString(),trajet: 'Cotonou-parakou',orderId: 'ox412fghb1',orderStatus: 'pending...',)));
    },
              child: Text('ok')
          )
           ],
        ),
      ),
    );
}
  void alertBalance(){


              Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallet()));
            }
}
