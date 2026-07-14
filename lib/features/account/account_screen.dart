import 'package:e_commerse/core/helpers/app_colors.dart';
import 'package:e_commerse/features/account/custom_profile_item.dart';
import 'package:e_commerse/features/account/logout.dart';
import 'package:e_commerse/features/account/profile_item_model.dart';
import 'package:e_commerse/features/location/location_screen.dart';
import 'package:e_commerse/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileItemModel> myIcons = [
      ProfileItemModel(title: "my_orders".tr(), icon: Icons.gif_box),
      ProfileItemModel(title: "my_details".tr(), icon: Icons.person),
      ProfileItemModel(
        title: "change_lang".tr(),
        icon: Icons.language,
        onPressed: () {
          if (context.locale.languageCode == 'en') {
            context.setLocale(const Locale('ar'));
          } else {
            context.setLocale(const Locale('en'));
          }
        },
      ),
      ProfileItemModel(
        title: "address_book".tr(),
        icon: Icons.home,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationScreen()),
          );
        },
      ),
      ProfileItemModel(title: "faqs".tr(), icon: Icons.question_mark_rounded),
      ProfileItemModel(
        title: "help_center".tr(),
        icon: Icons.headset_mic_outlined,
      ),
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
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Text(
                    "account".tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myIcons.length + 1,
                itemBuilder: (context, index) {
                  if (index == myIcons.length) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Logout(),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.logout, color: Colors.red),
                            const SizedBox(width: 8),
                            Text(
                              "logout".tr(),
                              style: const TextStyle(
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
                              icon: myIcons[index].icon,
                              text: myIcons[index].title,
                              onPressed: myIcons[index].onPressed,
                            ),
                            const Divider(
                              thickness: 8,
                              indent: 20,
                              endIndent: 20,
                            ),
                          ],
                        )
                      : CustomProfileItem(
                          icon: myIcons[index].icon,
                          text: myIcons[index].title,
                          onPressed: myIcons[index].onPressed,
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
