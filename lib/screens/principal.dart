import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tp_uber/models/directions_model.dart';
import 'package:tp_uber/widgets/specifications_page.dart';

class Principal extends StatefulWidget {
  var data;

  Principal();

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late GoogleMapController mapController;
  Marker _destination = const Marker(markerId: MarkerId('destination'));
  late Directions? _info;
  final LatLng _center = const LatLng(7.178622, 2.054885);  //7.178752, 2.054321
  Marker _origin = const Marker(markerId: MarkerId('origin'), position: LatLng(7.178622, 2.054885),
      infoWindow: InfoWindow(title: "Drone starting position"));
  String originAddress = '';
  String destinationAddress = ' Long Press to select destination';
  LatLng? originCoord;
  LatLng? destinationCoord;

  int balance = 0;
  String distance = "";

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'REAGLE',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
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
                zoom: 17.3,
              ),
              onLongPress: _addDestinationMarker,
              //onTap: _adddepartMarker,
              markers: {
                _origin,
                if (_destination != null) _destination
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
          SpecificationsPage(
            origin: originAddress,
            destination: destinationAddress,
            originCoord: originCoord,
            distance: distance,
            destinationCoord: destinationCoord,
          ),
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

  void _adddepartMarker(LatLng pos) {
    setState(() {
      originCoord = pos;
      _origin = Marker(
        markerId: const MarkerId('origin'),
        infoWindow: InfoWindow(title: 'Départ: $originAddress'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      );
      GetOriginAddress(_origin);
      _destination.position.latitude == 0.0;
    });
  }

  void _addDestinationMarker(LatLng pos) async {
    setState(() {
      destinationCoord = pos;
      _destination = Marker(
        markerId: const MarkerId('destination'),
        infoWindow: InfoWindow(title: destinationAddress),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,
      );
    });
    GetDestinationAddress(_destination);

    //print(_info!.totalDistance);
  }

  Future<void> GetOriginAddress(Marker mark) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        mark.position.latitude, mark.position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      originAddress =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  Future<void> GetDestinationAddress(Marker mark) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        mark.position.latitude, mark.position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      destinationAddress = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      distance = "${(calculateDistance(_center.latitude, _center.longitude, mark.position.latitude, mark.position.longitude)*1000).toStringAsFixed(2)}m";
    });
  }


  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));

  }

}
