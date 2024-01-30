import 'package:loccamb/module/home/data/models/address_model.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  String name;
  String userName;
  String email;
  AddressModel addressModel;

  User(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.addressModel});

  @override
  List<Object> get props => [id, name, userName, email, addressModel];
}
