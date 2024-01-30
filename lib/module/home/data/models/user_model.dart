import 'package:loccamb/module/home/data/models/address_model.dart';

import '../../domian/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.name,
      required super.userName,
      required super.email,
      required super.addressModel});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      addressModel: AddressModel.fromJson(json['address']),

    );
}
