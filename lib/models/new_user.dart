class NewUser {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  bool? active;
  String? password;
  int? gender;

  NewUser(
      {required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.active,
        required this.password,
        required this.gender});

  NewUser.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    active = json['active'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['active'] = this.active;
    data['password'] = this.password;
    data['gender'] = this.gender;
    return data;
  }
}
