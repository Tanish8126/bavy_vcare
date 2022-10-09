import 'package:babyv_care/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: kbg,
      body: Body(),
    );
  }
}
