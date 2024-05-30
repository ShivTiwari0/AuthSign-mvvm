import 'package:flutter/material.dart';

import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';

import 'package:softlab_project/utils/const.dart';

class FianlScreen extends StatelessWidget {
  const FianlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 7, top: 20, right: 8),
          child: Text(
            'FarmerEats',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height(context, 0.2),
            ),
            Center(child: Image.asset('assets/finalesc.png'))
          ])),
    );
  }
}
