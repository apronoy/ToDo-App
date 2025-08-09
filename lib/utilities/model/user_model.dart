class UserModel {
  dynamic id;
  String phone;
  String fullname;
   dynamic email;
  dynamic country;

  UserModel(
      {required this.id,
      required this.fullname,
      required this.phone,
      required this.country,
    
      required this.email,
       });
// model to map ..
  Map<String, dynamic> tomap() {
    return {
      'FullName': fullname,
      'Phone': phone,
      'Country':country,
      'Email': email,
       'Id': id,
    };
  }

// map to model
  factory UserModel.toModel(Map<String, dynamic> map) {
    return UserModel(
        fullname: map['FullName'],
        phone: map['Phone'],
        email: map['Email'],
         id: map['Id'],
         country: map['Country']);
  }
}
