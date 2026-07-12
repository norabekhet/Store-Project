import 'package:dio/dio.dart';
import 'package:e_commerse/features/location/location_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  Future<List<LocationModel>> getlocations() async {
    try {
      List<LocationModel> location = [];
      final Response response = await dio.get(
        "https://api.escuelajs.co/api/v1/locations",
      );
      for (var element in response.data) {
        final LocationModel address = LocationModel.fromJson(element);
        location.add(address);
      }

      return location;
    } on Exception {
      throw Exception("");
    }
  }
}
