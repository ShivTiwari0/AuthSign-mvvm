import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/utils/utils.dart';
import 'package:softlab_project/view/login_screen.dart';
import 'package:softlab_project/view/signup_screen/signup_screen2.dart';
import 'package:softlab_project/view/widget/icon_widget.dart';
import 'package:softlab_project/view/widget/textfield.dart';
import 'package:softlab_project/viewmodel/registration_viewmodel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameControllar = TextEditingController();
  final TextEditingController emailControllar = TextEditingController();
  final TextEditingController passwordControllar = TextEditingController();
  final TextEditingController repasswordControllar = TextEditingController();
  final TextEditingController phoneControllar = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode mEmailFocus = FocusNode();
  FocusNode mPassFocus = FocusNode();

  FocusNode mLNameFocus = FocusNode();
  FocusNode mConfirmPassFocus = FocusNode();
  FocusNode mMobileNumberFocus = FocusNode();

  @override
  void dispose() {
    nameControllar.dispose();
    emailControllar.dispose();
    passwordControllar.dispose();
    repasswordControllar.dispose();
    phoneControllar.dispose();
    mEmailFocus.dispose();
    mPassFocus.dispose();
    mLNameFocus.dispose();
    mConfirmPassFocus.dispose();
    mMobileNumberFocus.dispose();
    super.dispose();
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
                ' SignUp 1 of 4',
                style: TextStyle(color: textColorGrey),
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 46.75 / 32,
                  color: textColorblack,
                ),
                textAlign: TextAlign.center,
              ),
              15.height,
              const Row(
                children: [
                  IconWidget(imagePath: 'assets/google.png'),
                  IconWidget(imagePath: 'assets/fb.png'),
                  IconWidget(imagePath: 'assets/apple.png'),
                ],
              ),
              20.height,
              const Center(
                child: Text(
                  'or SignUp with',
                  style: TextStyle(color: textColorGrey, fontSize: 12),
                ),
              ),
              SizedBox(height: height(context, 0.05)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        controller: nameControllar,
                        focus: mLNameFocus,
                        icon: Icons.perm_identity,
                        nextFocus: mEmailFocus,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Utils.snackBar("Enter Valid Name", context);
                          }
                          return null;
                        },
                        hintText: "Full Name"),
                    10.height,
                    CustomFormField(
                        controller: emailControllar,
                        focus: mEmailFocus,
                        nextFocus: mMobileNumberFocus,
                        icon: Icons.alternate_email,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return Utils.snackBar(
                                'Please Enter Valid Email', context);
                          }
                          return null;
                        },
                        hintText: 'Email Address'),
                    10.height,
                    CustomFormField(
                        controller: phoneControllar,
                        nextFocus: mPassFocus,
                        icon: Icons.phone,
                        focus: mMobileNumberFocus,
                        validator: (value) {
                          if (value!.isEmpty ||
                              value.length > 10 ||
                              value.length < 10) {
                            return Utils.snackBar(
                                'Please Valid Phone Number', context);
                          }
                          return null;
                        },
                        hintText: 'Phone Number'),
                    10.height,
                    CustomFormField(
                        controller: passwordControllar,
                        focus: mPassFocus,
                        nextFocus: mConfirmPassFocus,
                        icon: Icons.lock,
                        validator: (p0) {
                          if (p0!.isEmpty ||
                              repasswordControllar.text.isEmpty ||
                              p0 != repasswordControllar.text) {
                            return Utils.snackBar(
                                'Please Enter Password Correctly', context);
                          }
                          return null;
                        },
                        hintText: 'Password'),
                    10.height,
                    CustomFormField(
                        controller: repasswordControllar,
                        focus: mConfirmPassFocus,
                        icon: Icons.lock,
                        validator: (p0) {
                          if (p0!.isEmpty ||
                              repasswordControllar.text.isEmpty ||
                              p0 != passwordControllar.text) {
                            return Utils.snackBar(
                                'Please Enter Password Correctly', context);
                          }
                          return null;
                        },
                        hintText: 'Re-enter Password'),
                    SizedBox(
                      height: height(context, 0.1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                        CustomButton(
                          onPressed: () {
                            final valid = _formKey.currentState!.validate();

                            if (!valid) {
                              print('object');
                            } else {
                              provider.updateFullName(nameControllar.text);
                              provider.updateEmail(emailControllar.text);
                              provider.updatePhone(phoneControllar.text);
                              provider.updatePassword(passwordControllar.text);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen2(),
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
