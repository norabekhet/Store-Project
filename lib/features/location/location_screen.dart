import 'package:e_commerse/features/location/custom_address.dart';
import 'package:e_commerse/features/location/location_cubit.dart';
import 'package:e_commerse/features/location/location_model.dart';
import 'package:e_commerse/features/location/location_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LocationCubit()..getlocation(),
        child: Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          body: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Text(
                        "Location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 48),
                  ],
                ),
                Divider(),
                SizedBox(height: 20),
                Text(
                  "Saved Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 14),
                BlocBuilder<LocationCubit, LocationStates>(
                  builder: (context, state) {
                    if (state is loadinglocation) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is successlocation) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.successaddress.length,
                          itemBuilder: (context, index) {
                            return CustomAddress(
                              locationModel: state.successaddress[index],
                            );
                          },
                        ),
                      );
                    }
                    if (state is failurelocation) {
                      return Center(child: Text("error"));
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
