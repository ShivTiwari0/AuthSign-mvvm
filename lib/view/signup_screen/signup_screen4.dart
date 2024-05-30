import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/utils.dart';
import 'package:softlab_project/view/signup_screen/final_screen.dart';
import 'package:softlab_project/view/signup_screen/signup_screen3.dart';
import 'package:softlab_project/view/widget/buisnesshour.dart';
import 'package:softlab_project/viewmodel/registration_viewmodel.dart';

class SignUpScreen4 extends StatefulWidget {
  const SignUpScreen4({super.key});

  @override
  State<SignUpScreen4> createState() => _SignUpScreen4State();
}

class _SignUpScreen4State extends State<SignUpScreen4> {
  Map<String, List<String>> _selectedBusinessHours = {};

  void _onHoursChanged(Map<String, List<String>> selectedBusinessHours) {
    setState(() {
      _selectedBusinessHours = selectedBusinessHours;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                ' SignUp 4 of 4',
                style: TextStyle(color: textColorGrey),
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              Text(
                'Business Hours',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 46.75 / 32,
                  color: textColorblack,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height(context, 0.03)),
              const Text(
                'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
                style: TextStyle(
                  fontFamily: 'Be Vietnam',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 20.45 / 14,
                  color: textColorGrey,
                ),
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: height(context, 0.05),
              ),
              BusinessHoursSelector(
                onHoursChanged: _onHoursChanged,
              ),
              SizedBox(
                height: height(context, 0.1),
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
                    onPressed: () async {
                      provider.updateBusinessHours(_selectedBusinessHours);

                      await provider.submitRegistration();

                      if (provider.message != null) {
                        Utils.toastMessage(
                          provider.message!,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FianlScreen(),
                            ));
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
              SizedBox(
                height: height(context, 0.04),
              ),
              SizedBox(
                height: height(context, 0.04),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
