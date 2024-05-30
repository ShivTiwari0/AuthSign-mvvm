import 'dart:async';

import 'package:flutter/material.dart';

import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/const.dart';
import 'package:softlab_project/utils/extension.dart';
import 'package:softlab_project/utils/int_extensions.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:softlab_project/view/login_screen.dart';
import 'package:softlab_project/view/widget/onboarding_widget.dart';

import 'package:provider/provider.dart';

class StartUPScreeen extends StatelessWidget {
  const StartUPScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnBoarding(
          image: 'assets/onboarding1.png',
          color: tgreen,
          text2:
              'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ',
          text1: 'Quality'),
      OnBoarding(
          image: 'assets/onboarding2.png',
          color: pred,
          text2:
              'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers. ',
          text1: 'Convenient'),
      OnBoarding(
          image: 'assets/onboarding3.png',
          color: const Color(0xFFF8C569),
          text2:
              'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.  ',
          text1: 'Local'),
    ];

    return Scaffold(
      backgroundColor: tgreen,
      body: IntroductionScreen(
        showBackButton: false,
        showNextButton: false,
        overrideDone: Container(),
        rawPages: pages,
        dotsDecorator: const DotsDecorator(
            colors: [
              tgreen,
              pred,
              Color(0xFFF8C569),
            ],
            activeColors: [
              tgreen,
              pred,
              Color(0xFFF8C569),
            ],
            activeShape: OvalBorder(
              side: BorderSide(width: 13, color: textColorGrey),
            )),
        onDone: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        },
      ),
    );
  }
}
