import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showSnackBar({
  required String msg,
  required AnimatedSnackBarType type,
  required BuildContext context,
}) {
  print("Snack Called");

  AnimatedSnackBar.material(
    msg,
    type: type,
    mobileSnackBarPosition: MobileSnackBarPosition.top,
  ).show(context);
}
