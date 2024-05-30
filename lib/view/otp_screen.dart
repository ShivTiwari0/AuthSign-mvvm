import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:softlab_project/repositories/verify_repo.dart';
import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/const.dart';
import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/utils/utils.dart';

import 'package:softlab_project/view/login_screen.dart';
import 'package:softlab_project/view/reset_password_screen.dart';
import 'package:softlab_project/viewmodel/verifyotp_viewmodel.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.number,
  });

  final String number;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int sec = 29;
  Timer? timer;
  bool isLoading = false;
  TextEditingController otpController = TextEditingController();
  String? token;
  String? otpData;
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sec == 0) {
        timer.cancel();
        sec = 30;
        setState(() {});
      } else {
        setState(() {
          sec--;
        });
      }
    });
  }

  Future<void> verifyOtp(context) async {
    final otp = otpController.text;
    print(otpData);
    print(otp);
    if (otpData!.isEmpty || otpData!.length != 5) {
      Utils.toastMessage('Please enter a valid OTP');
      return;
    }

    final viewModel = Provider.of<VerifyOtpViewModel>(context, listen: false);
    final response = await viewModel.verifyOtp(otpData!);

    if (response['success'] == true) {
      Utils.toastMessage(response['message']);
      final String token = response['token'];

      print('Token: $token');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResetPasswordScreen(
                  token: token,
                )),
      );
    } else {
      Utils.snackBar(response['message'], context);
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
                'Verify OTP',
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
                          builder: (context) => const LoginScreen(),
                        )),
                    child: const Text(
                      ' Login',
                      style: TextStyle(color: pred),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: height(context, 0.08),
                  ),
                  OtpTextField(
                    handleControllers:
                        (List<TextEditingController?> controllers) {
                      otpController = controllers[0]!;
                    },
                    onSubmit: (value) {
                      print('>>>>>>>>>>>>>${value.length}');
                      otpData = value;
                      if (value.length == 5) {
                        print(value.length);
                        verifyOtp(context);
                      }
                    },
                    fieldWidth: 55,
                    numberOfFields: 5,
                    fieldHeight: 55,
                    fillColor: blackColor,
                    enabled: true,
                    showFieldAsBox: true,
                    focusedBorderColor: borderColorgrey,
                    enabledBorderColor: borderColorgrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(7),
                    cursorColor: textColorblue,
                    textStyle: TextStyle(
                      color: textColorgrey,
                      fontFamily: font,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: height(context, 0.05),
                  ),
                  CustomButton(
                    onPressed: () {
                      verifyOtp(context);
                    },
                    width: width(context, 0.8),
                    height: height(context, 0.07),
                    backgroundColor: pred,
                    text: 'Submit',
                    borderRadius: BorderRadius.circular(30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
