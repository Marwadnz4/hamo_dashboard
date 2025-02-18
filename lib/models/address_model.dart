class AddressModel{
  final num lat;
  final num lng;

  AddressModel({required this.lat, required this.lng});
  
  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng,
  };
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}