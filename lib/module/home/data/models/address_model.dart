class AddressModel {
  final String street;
  final String city;
  final String zipCode;

  AddressModel(
      {required this.street, required this.city, required this.zipCode});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json['street'],
        city: json['city'],
        zipCode: json['zipcode'],
      );
}
