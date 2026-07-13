import 'package:e_commerse/features/account/account_screen.dart';
import 'package:e_commerse/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Icon(Icons.warning_amber, color: Colors.red, size: 55),
          Text("Logout?", style: TextStyle(fontWeight: FontWeight.w700)),
          Text(
            "Are you sure you want to logout?",
            style: TextStyle(
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
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "Yes,Logout",
                  style: TextStyle(color: Colors.white),
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
                child: Text("No,cancel", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
