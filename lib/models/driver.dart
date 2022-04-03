import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Driver{
  String id;
  String firstName;
  String surname;
  String email;
  String phone;
  String password;
  int vehiculeType;
  double availableBalance;
  int rate;
  int pricePropostion;
  String licensePlateNumber;
  bool active;
  Driver({@required this.firstName='',
    @required this.surname='',
    @required this.rate=5,
    @required this.pricePropostion=0,
    @required this.licensePlateNumber='',
    @required this.password='',
    @required this.email='',
    @required this.availableBalance=0.0,
    @required this.id='',
    @required this.phone='',
    @required this.vehiculeType=0,
    @required this.active=true,
  });
}