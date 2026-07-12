import 'package:flutter/material.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.black),
              Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(),
              IconButton(
                onPressed: () {
                  print("clik");
                },
                icon: Icon(Icons.arrow_forward_ios_outlined, size: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
