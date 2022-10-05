import 'package:babyv_care/screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/bookings.dart';
import '../screens/messages.dart';
import '../screens/settings/settings.dart';
import 'constants.dart';
import 'enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = kPrimaryLightColor;
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 0),
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: kbg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }),
          IconButton(
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                color: MenuState.message == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, MessageScreen.routeName);
              }),
          IconButton(
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset("assets/icons/receipt.svg",
                  color: MenuState.bookings == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor),
              onPressed: () {
                Navigator.pushNamed(context, BookingScreen.routeName);
              }),
          IconButton(
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              }),
        ],
      ),
    );
  }
}
