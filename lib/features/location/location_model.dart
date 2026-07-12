class LocationModel {
  final String Address;
  final String detailedAddress;

  LocationModel({required this.Address, required this.detailedAddress});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      Address: json['name'],
      detailedAddress: json['description'],
    );
  }
}
