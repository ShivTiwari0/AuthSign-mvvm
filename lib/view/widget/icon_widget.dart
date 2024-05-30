import 'package:flutter/material.dart';
import 'package:softlab_project/utils/colors.dart';

class IconWidget extends StatelessWidget {
  final String imagePath;

  const IconWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 96,
        height: 52,
        margin: const EdgeInsets.only(top: 10, left: 20),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(width: 1, color: textColorGrey.withOpacity(0.4)),
        ),
        child: Image.asset(
          imagePath,
          height: 10,
        ),
      ),
    );
  }
}
