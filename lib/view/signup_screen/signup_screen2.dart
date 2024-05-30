import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:softlab_project/repositories/registration_repo.dart';
import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/utils/utils.dart';
import 'package:softlab_project/view/login_screen.dart';
import 'package:softlab_project/view/signup_screen/signup_screen3.dart';
import 'package:softlab_project/view/widget/dropdown.dart';
import 'package:softlab_project/view/widget/icon_widget.dart';
import 'package:softlab_project/view/widget/textfield.dart';
import 'package:softlab_project/viewmodel/registration_viewmodel.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final TextEditingController buisnessControllar = TextEditingController();
  final TextEditingController inNameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedState;

  FocusNode buisnessFocusNode = FocusNode();
  FocusNode inNameFocusNode = FocusNode();
  FocusNode streetFocusNode = FocusNode();
  FocusNode citydFocusNode = FocusNode();
  FocusNode zipFocusNode = FocusNode();

  @override
  void dispose() {
    buisnessControllar.dispose();
    inNameController.dispose();
    streetController.dispose();
    zipController.dispose();

    buisnessFocusNode.dispose();
    inNameFocusNode.dispose();
    streetFocusNode.dispose();
    citydFocusNode.dispose();
    zipFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> indianStates = [
      'Andhra Pradesh',
      'Arunachal Pradesh',
      'Assam',
      'Bihar',
      'Chhattisgarh',
      'Goa',
      'Gujarat',
      'Haryana',
      'Himachal Pradesh',
      'Jharkhand',
      'Karnataka',
      'Kerala',
      'Madhya Pradesh',
      'Maharashtra',
      'Manipur',
      'Meghalaya',
      'Mizoram',
      'Nagaland',
      'Odisha',
      'Punjab',
      'Rajasthan',
      'Sikkim',
      'Tamil Nadu',
      'Telangana',
      'Tripura',
      'Uttar Pradesh',
      'Uttarakhand',
      'West Bengal',
    ];

    final provider = Provider.of<RegistrationViewModel>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 7.0, top: 20, right: 8),
          child: Text(
            'FarmerEats',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height(context, 0.04),
              ),
              const Text(
                ' SignUp 2 of 4',
                style: TextStyle(color: textColorGrey),
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              Text(
                'Farm Info',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 46.75 / 32,
                  color: textColorblack,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height(context, 0.03)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        controller: buisnessControllar,
                        icon: Icons.tag,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return Utils.snackBar(
                                'Enter Buisness Name', context);
                          }
                          return null;
                        },
                        nextFocus: inNameFocusNode,
                        hintText: "Buisness Name"),
                    10.height,
                    CustomFormField(
                        controller: inNameController,
                        icon: Icons.emoji_emotions_outlined,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return Utils.snackBar(
                                'Enter Informal Name', context);
                          }
                          return null;
                        },
                        focus: inNameFocusNode,
                        nextFocus: streetFocusNode,
                        hintText: 'Informal name'),
                    10.height,
                    CustomFormField(
                        controller: streetController,
                        icon: Icons.home,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return Utils.snackBar(
                                'Enter Street Address', context);
                          }
                          return null;
                        },
                        focus: streetFocusNode,
                        nextFocus: citydFocusNode,
                        hintText: 'Street Address'),
                    10.height,
                    CustomFormField(
                        controller: cityController,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return Utils.snackBar('Enter City', context);
                          }
                          return null;
                        },
                        focus: citydFocusNode,
                        nextFocus: zipFocusNode,
                        icon: Icons.location_pin,
                        hintText: 'City'),
                    10.height,
                    Row(
                      children: [
                        Expanded(
                            child: CustomDropdownField(
                          items: indianStates,
                          icon: Icons.arrow_drop_down,
                          hintText: 'Select a State',
                          selectedItem: selectedState,
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                            });
                            print('Selected state: $value');
                          },
                        )),
                        10.width,
                        Expanded(
                          child: CustomFormField(
                              controller: zipController,
                              icon: Icons.lock,
                              hintText: 'enter Zip Code'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height(context, 0.2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back)),
                        CustomButton(
                          onPressed: () {
                            int zip = int.parse(zipController.text);
                            final valid = _formKey.currentState?.validate();
                            if (!valid! || selectedState!.isEmpty) {
                            } else {
                              provider
                                  .updateBusinessName(buisnessControllar.text);
                              provider
                                  .updateInformalName(inNameController.text);
                              provider.updateAddress(streetController.text);
                              provider.updateCity(cityController.text);
                              provider.updateZipCode(zip);
                              provider.updateState(selectedState!);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen3()));
                            }
                          },
                          width: width(context, 0.55),
                          height: height(context, 0.07),
                          backgroundColor: pred,
                          text: 'Continue',
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
