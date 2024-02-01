import 'geo_model.dart';

class AddressModel {
  final String street;
  final String city;
  final String zipCode;
  final GeoModel geoModel;

  AddressModel(
      {required this.street,
      required this.city,
      required this.zipCode,
      required this.geoModel});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json['street'],
        city: json['city'],
        zipCode: json['zipcode'],
        geoModel: GeoModel.fromJson(json['geo']),
      );
}
