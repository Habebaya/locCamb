class GeoModel {
  final String lat;
  final String long;


  GeoModel(
      {required this.lat, required this.long,});

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json['lat'],
        long: json['lng'],
      );
}
