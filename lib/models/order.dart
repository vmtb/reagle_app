import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Order{
  String id;
  String clientId;
  String driverId;
  double price;
  double distance;
 // DateTime createdAt;
 // DateTime sheduledAt;
  int status;
  int clientCode;
  int driverCode;
  int clientRate;
  int driverRate;
  String clientNote;

  Order({
    @required this.id='',
    @required this.price=0,
    @required this.clientCode=0,
    @required this.clientId='',
    @required this.clientNote='',
    @required this.clientRate=5,
    @required this.distance=0.0,
    @required this.driverCode =1,
    @required this.driverId='',
    @required this.driverRate=5,
    @required this.status=0,
  });
}