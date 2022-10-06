import 'package:flutter/material.dart';

import '../../utils/enums.dart';
import '../../utils/custtom_bottom_nav_bar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
