import 'package:e_commerse/features/home%20screen/products/product_states.dart';
import 'package:e_commerse/features/location/location_states.dart';
import 'package:e_commerse/features/location/remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit() : super(initiallocation());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getlocation() async {
    emit(loadinglocation());
    await remoteDataSource.getlocations().then(
      (val) {
        emit(successlocation(successaddress: val));
      },
      onError: (Error) {
        emit(failurelocation());
      },
    );
  }
}
