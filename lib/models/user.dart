class User {
  String? context;
  String? id;
  String? type;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  //String? driverProfile;
  bool? active;
 // String? clientProfile;
  int? availableBalance;
  int? gender;

  User(
      {this.context,
        this.id,
        this.type,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        //this.driverProfile,
        this.active,
        //this.clientProfile,
        this.availableBalance,
        this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
    context: json['@context'],
    id: json['@id'],
    type: json['@type'],
    firstName : json['firstName'],
    lastName : json['lastName'],
    phoneNumber : json['phoneNumber'],
    //driverProfile : json['driverProfile'],
    active : json['active'],
   // clientProfile : json['clientProfile'],
    availableBalance : json['availableBalance'],
    gender : json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    //data['driverProfile'] = this.driverProfile;
    data['active'] = this.active;
    //data['clientProfile'] = this.clientProfile;
    data['availableBalance'] = this.availableBalance;
    data['gender'] = this.gender;
    return data;
  }
}
