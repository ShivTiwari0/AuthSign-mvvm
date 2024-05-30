import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:softlab_project/utils/const.dart';

height(BuildContext context, double size) {
  return MediaQuery.of(context).size.height * size;
}

width(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

backButton(VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Image.asset(
      backbutton,
      width: 100, // Adjust width as needed
      height: 100, // Adjust height as needed
    ),
  );
}

openBrowser(browseUrl) async {
  if (await canLaunchUrlString(browseUrl)) {
    await launchUrlString(browseUrl);
  } else {
    throw 'Could not launch $browseUrl';
  }
}

Widget divider(BuildContext context) {
  return Container(
    width: width(context, 1),
    height: height(context, 0.002),
    margin: const EdgeInsets.only(top: 1),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.35, 0.45, 0.65], // Adjust stops for smooth transition
        colors: [
          Color.fromRGBO(33, 36, 38, 0.6), // Darker color on the left
          Color.fromRGBO(255, 255, 255, 0.103), // Lighter color in the center
          Color.fromRGBO(33, 36, 38, 0.6), // Darker color on the right
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(27, 29, 31, 1),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
