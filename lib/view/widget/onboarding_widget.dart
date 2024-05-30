import 'package:flutter/material.dart';
import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/extension.dart';
import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/view/login_screen.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding(
      {super.key,
      required this.image,
      required this.color,
      required this.text2,
      required this.text1});
  String? image;
  Color? color;
  String? text2;
  String? text1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Container(
        color: color,
        height: height(context, 1),
        child: Column(
          children: [
            Image.asset(image!,
                fit: BoxFit.fitWidth,
                height: context.height() / 2,
                width: context.width() / 1),
            20.height,
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width * 0.1),
                    topRight: Radius.circular(size.width * 0.1),
                  ),
                ),
                child: Column(
                  children: [
                    30.height,
                    Text(
                      text1!,
                      style: TextStyle(
                        color: textColorblack,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                    ),
                    15.height,
                    Text(
                      text2!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 20.45 / 14,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    CustomButton(
                        width: size.width * 0.6,
                        height: size.height * 0.06,
                        borderRadius: BorderRadius.circular(30),
                        backgroundColor: color!,
                        text: "Join the movement!",
                        onPressed: () {}),
                    15.height,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 20.45 / 14,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
