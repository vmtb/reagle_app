import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tp_uber/screens/transport_way.dart';
import 'custom_text_field.dart';
import 'dart:math';
class SpecificationsPage extends StatefulWidget {
  String origin;
  String destination;
  LatLng? originCoord;
  LatLng? destinationCoord;
SpecificationsPage({@required  this.origin='', @required this.destination='',@required this.originCoord, @required this.destinationCoord});

  @override
  _SpecificationsPageState createState() => _SpecificationsPageState();
}
class _SpecificationsPageState extends State<SpecificationsPage> {
  bool? reserVal = false;
  bool show=false;
  TextEditingController departController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController reservController = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time= TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return  Opacity(
      opacity: 0.9,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.25,
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: ListView(
            children: [
              Column(
                children: [
                  Text(
                    'Départ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.green),
                  ),
                  Text(widget.origin),
                  Text(
                    'Destination',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.green),
                  ),
                  Text(widget.destination),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Heure de départ'),
                      Text( ': ${time.hour}:${time.minute}', style: TextStyle(fontWeight: FontWeight.bold),),
                      ElevatedButton(onPressed: () async {
                        TimeOfDay? tim=  await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now());
                        if(tim==null) return;
                        setState(() {
                          time=tim;
                        });
                      }, child: Text('Change')),
                    ],
                  ),
                  SizedBox(height: 5,),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>TransportWay(
                        distance: getDistanceFromLatLonInKm(widget.originCoord?.latitude,widget.originCoord?.longitude, widget.destinationCoord?.latitude, widget.destinationCoord?.longitude).toStringAsFixed(3),
                        orderStatus: 'Pending...',
                        orderId: '0x23f4J564',
                        trajet: '${widget.origin} - ${widget.destination}',
                        prices: calcPrice(getDistanceFromLatLonInKm(widget.originCoord?.latitude,widget.originCoord?.longitude, widget.destinationCoord?.latitude, widget.destinationCoord?.longitude)),
                        startTime: time,
                      ))
                    );
                  }, child: Text('Suivant')),
                ],
              ),
            ],
          )),
    );
  }

   getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var d = 0.0;

    if(lat1==null || lat2==null || lon1==null || lon2 == null){
      d =0;
    } else{
      var R = 6371; // Radius of the earth in km
      var dLat = deg2rad(lat2-lat1);  // deg2rad below
      var dLon = deg2rad(lon2-lon1);
      var a =
          sin(dLat/2) * sin(dLat/2) +
              cos(deg2rad(lat1)) * cos(deg2rad(lat2)) *
                  sin(dLon/2) * sin(dLon/2)
      ;
      var c = 2 * atan2(sqrt(a), sqrt(1-a));
      d = R * c; // Distance in km

      }
    return d;
  }

  deg2rad(deg) {
    return deg * (pi/180);
  }
  calcPrice(double dist){
    double bikePrice = 0;
    double carPrice =0;
    if(dist<2){
      bikePrice=100;
      carPrice=200;
    } else if(dist>=2 && dist<50){
      bikePrice = 40*dist;
      carPrice=50*dist;
    } else if(dist>=10 && dist<50){
      bikePrice=100*dist;
      carPrice = 20*dist;
    }else{
      bikePrice=95*dist;
      carPrice=20*dist;
    }
    var price = [bikePrice.floorToDouble(),carPrice.floorToDouble()];
    return price;
  }
}
