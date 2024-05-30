import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:softlab_project/repositories/registration_repo.dart';
import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';

import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/utils/utils.dart';
import 'package:softlab_project/view/login_screen.dart';
import 'package:softlab_project/view/otp_screen.dart';

import 'package:softlab_project/view/widget/textfield.dart';
import 'package:softlab_project/viewmodel/forgotpass_viewmodel.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var response;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> sendOtp(context) async {
    final phone = phoneController.text;

    if (_formKey.currentState!.validate()) {
      final viewModel =
          Provider.of<ForgotPasswordViewModel>(context, listen: false);

      final response = await viewModel.sendOtp('+$phone');

      if (response['success'] == true) {
        Utils.toastMessage(response['message']);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              number: phone,
            ),
          ),
        );
      } else {
        Utils.snackBar(response['message'], context);
      }
    } else {
      setState(() {
        Utils.toastMessage('Please enter a valid phone number');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                height: height(context, 0.07),
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 46.75 / 32,
                  color: textColorblack,
                ),
                textAlign: TextAlign.center,
              ),
              15.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    ' Remember Your Pasword?',
                    style: TextStyle(color: textColorGrey),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        )),
                    child: const Text(
                      ' Login',
                      style: TextStyle(color: pred),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: height(context, 0.08),
                    ),
                    CustomFormField(
                        controller: phoneController,
                        icon: Icons.phone,
                        validator: (p0) {
                          if (p0!.length != 10) {
                            return Utils.toastMessage(
                                'Please Enter Valid Number');
                          }
                          return null;
                        },
                        hintText: 'Phone Number'),
                    SizedBox(
                      height: height(context, 0.05),
                    ),
                    CustomButton(
                      onPressed: () => sendOtp(context),
                      width: width(context, 0.87),
                      height: height(context, 0.07),
                      backgroundColor: pred,
                      text: 'Send Code',
                      borderRadius: BorderRadius.circular(30),
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
