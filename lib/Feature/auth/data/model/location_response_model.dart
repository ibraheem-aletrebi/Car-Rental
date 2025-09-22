class LocationResponseModel {
  final int id;
  final String name;
  final double lat;
  final double lng;


  LocationResponseModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng
  });


 factory LocationResponseModel.fromJson(Map<String, dynamic> json){
    return LocationResponseModel(
      id: json['id'],
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }


  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'lat': lat,
      'lng': lng,
    };
  }


}

