import 'package:flutter/material.dart';
import 'package:softlab_project/utils/colors.dart';

enum TextFieldType {
  EMAIL,
  PASSWORD,
  NAME,
  @Deprecated('Use MULTILINE instead. ADDRESS will be removed in major update')
  ADDRESS,
  MULTILINE,
  OTHER,
  PHONE,
  URL,
  NUMBER,
  USERNAME
}

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final String? Function(String?)? validator;
  final FocusNode? focus;
  final TextInputType? keyboardType;
  final TextFieldType? textFieldType;
  final Function(String)? onFieldSubmitted;
  final FocusNode? nextFocus;

  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.hintText,
      this.validator,
      this.focus,
      this.keyboardType,
      this.textFieldType,
      this.onFieldSubmitted,
      this.nextFocus})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    TextInputType? applyTextInputType() {
      if (widget.keyboardType != null) {
        return widget.keyboardType;
      } else if (widget.textFieldType == TextFieldType.EMAIL) {
        return TextInputType.emailAddress;
      } else if (widget.textFieldType == TextFieldType.MULTILINE) {
        return TextInputType.multiline;
      } else if (widget.textFieldType == TextFieldType.PASSWORD) {
        return TextInputType.visiblePassword;
      } else if (widget.textFieldType == TextFieldType.PHONE ||
          widget.textFieldType == TextFieldType.NUMBER) {
        return TextInputType.number;
      } else if (widget.textFieldType == TextFieldType.URL) {
        return TextInputType.url;
      } else {
        return TextInputType.text;
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey[200],
      ),
      child: TextFormField(
          controller: widget.controller,
          style: const TextStyle(
            color: blackColor,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            icon: Icon(widget.icon, color: Colors.black),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 14, color: textColorGrey),
          ),
          keyboardType: applyTextInputType(),
          onFieldSubmitted: (s) {
            if (widget.nextFocus != null)
              FocusScope.of(context).requestFocus(widget.nextFocus);

            if (widget.onFieldSubmitted != null)
              widget.onFieldSubmitted!.call(s);
          },
          validator: widget.validator,
          focusNode: widget.focus),
    );
  }
}
