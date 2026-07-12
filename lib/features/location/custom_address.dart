import 'package:e_commerse/features/location/location_model.dart';
import 'package:flutter/material.dart';

class CustomAddress extends StatelessWidget {
  const CustomAddress({super.key, required this.locationModel});
  final LocationModel locationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: ListTile(
          title: Text(
            locationModel.Address,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            locationModel.Address,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          leading: Icon(Icons.location_on_outlined, color: Colors.grey),
        ),
      ),
    );
  }
}
