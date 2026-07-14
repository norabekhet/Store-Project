import 'package:e_commerse/features/account/account_screen.dart';
import 'package:e_commerse/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          const Icon(Icons.warning_amber, color: Colors.red, size: 55),
          Text(
            "logout_title".tr(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            "logout_message".tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
      actions: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  "yes_logout".tr(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "no_cancel".tr(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
