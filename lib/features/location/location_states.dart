import 'package:e_commerse/features/location/location_model.dart';

abstract class LocationStates {}

class initiallocation extends LocationStates {}

class loadinglocation extends LocationStates {}

class failurelocation extends LocationStates {}

class successlocation extends LocationStates {
  final List<LocationModel> successaddress;
  successlocation({required this.successaddress});
}
