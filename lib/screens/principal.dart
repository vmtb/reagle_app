import 'package:flutter/material.dart';
import 'package:tp_uber/directions_repository.dart';
import 'package:tp_uber/models/directions_model.dart';
import 'package:tp_uber/services/user_services.dart';
import 'package:tp_uber/widgets/specifications_page.dart';
import '../widgets/CustomDrawer.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tp_uber/models/new_user.dart';

class Principal extends StatefulWidget {
  var data;
  Principal(@required this.data);
  @override
  _PrincipalState createState() => _PrincipalState();
}





class _PrincipalState extends State<Principal> {

  late GoogleMapController mapController;
  Marker _origin = Marker(markerId: MarkerId('origin'));
  Marker _destination= Marker(markerId: MarkerId('destination'));
  late Directions? _info;
  final LatLng _center = const LatLng(6.4485200,2.3556600);
  String originAddress='touchez votre point de départ sur la carte';
  String destinationAddress=' appuyer longuement sur le le point de destination';
  LatLng? originCoord;
  LatLng? destinationCoord;

  int balance=0;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TP-Uber', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      drawer: CustomDrawer(widget.data),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.orange[400],
            ),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
              onLongPress: _addDestinationMarker,
              onTap: _adddepartMarker,
              markers: {
                if(_origin!= null) _origin,
                if(_destination!=null) _destination
              },
             /* polylines: {
                if(_info !=null){
                  Polyline(polylineId:
                  PolylineId('Overview_polyline'),
                  color: Colors.red,
                    width: 5,
                    points: _info.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
                }
              },*/
            ),
          ),
          SpecificationsPage(origin: originAddress, destination: destinationAddress,originCoord: originCoord,destinationCoord: destinationCoord, ),
          /*Positioned(
              width: 70,
              height: 20,
              top: 25,
              left: 25,

              child: Container(
                  color: Colors.yellow,
                  child: Text(dist))),*/
        ],
      ),
    );
  }
  void _adddepartMarker(LatLng pos){
      setState(() {
        originCoord=pos;
        _origin=Marker(
          markerId: MarkerId('origin'),
          infoWindow: InfoWindow(title: 'Départ: $originAddress'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        GetOriginAddress(_origin);
         _destination.position.latitude==0.0;
      });


  }
  void _addDestinationMarker(LatLng pos) async{

    setState(() {
      destinationCoord=pos;
      _destination=Marker(
        markerId: MarkerId('destination'),
        infoWindow: InfoWindow(title: destinationAddress),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,

      );


    });
    GetDestinationAddress(_destination);
    
     //print(_info!.totalDistance);
  }

  Future<void> GetOriginAddress(Marker mark)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(mark.position.latitude, mark.position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      originAddress='${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }
  Future<void> GetDestinationAddress(Marker mark)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(mark.position.latitude, mark.position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      destinationAddress='${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }
}
