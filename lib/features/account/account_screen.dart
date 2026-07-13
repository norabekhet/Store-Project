import 'package:e_commerse/core/helpers/app_colors.dart';
import 'package:e_commerse/features/account/custom_profile_item.dart';
import 'package:e_commerse/features/account/logout.dart';
import 'package:e_commerse/features/account/profile_item_model.dart';
import 'package:e_commerse/features/location/location_screen.dart';
import 'package:e_commerse/main_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileItemModel> MyIcons = [
      ProfileItemModel(title: "My Orders", icon: Icons.gif_box),
      ProfileItemModel(title: "My Details", icon: Icons.person),
      ProfileItemModel(
        title: "Address Book",
        icon: Icons.home,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LocationScreen();
              },
            ),
          );
        },
      ),
      ProfileItemModel(title: "FAQs", icon: Icons.question_mark_rounded),
      ProfileItemModel(title: "Help Center", icon: Icons.headset_mic_outlined),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainScreen();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Expanded(
                  child: Text(
                    "Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: MyIcons.length + 1,
                itemBuilder: (context, index) {
                  if (index == MyIcons.length) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Logout();
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return (index == 0 || index == 4)
                      ? Column(
                          children: [
                            CustomProfileItem(
                              icon: MyIcons[index].icon,
                              text: MyIcons[index].title,
                              onPressed: MyIcons[index].onPressed,
                            ),
                            const Divider(
                              thickness: 8,
                              indent: 20,
                              endIndent: 20,
                            ),
                          ],
                        )
                      : CustomProfileItem(
                          icon: MyIcons[index].icon,
                          text: MyIcons[index].title,
                          onPressed: MyIcons[index].onPressed,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
