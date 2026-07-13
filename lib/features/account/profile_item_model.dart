import 'package:flutter/material.dart';

class ProfileItemModel {
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  ProfileItemModel({required this.title, required this.icon, this.onPressed});
}
