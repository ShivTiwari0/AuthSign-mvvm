import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';

import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/utils/utils.dart';
import 'package:softlab_project/view/forgotpass_screen.dart';

import 'package:softlab_project/view/signup_screen/signup_screen.dart';
import 'package:softlab_project/view/widget/icon_widget.dart';
import 'package:softlab_project/viewmodel/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailControllar = TextEditingController();
  final TextEditingController passControllar = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var response;
  String? token;

  @override
  void dispose() {
    emailControllar.dispose();
    passControllar.dispose();
    super.dispose();
  }

  Future<void> handleLogin(context) async {
    if (_formKey.currentState!.validate()) {
      final email = emailControllar.text;
      final password = passControllar.text;
      const role = 'farmer';
      const deviceToken = '0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx';
      const type = 'email';
      const socialId = '0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx';

      final viewModel = Provider.of<LoginViewModel>(context, listen: false);

      response = await viewModel.login(
          email, password, role, deviceToken, type, socialId);

      if (response['success'] == true) {
        Utils.toastMessage(response['message']);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => OtpScreen(
        //       number: email,
        //       telcode: '1',
        //     ),
        //   ),
        // );

        token = response['token'];
      } else {
        Utils.snackBar(response['message'], context);
      }
    } else {
      setState(() {
        Utils.snackBar(response['message'], context);
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
                'Welcome back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 46.75 / 32,
                  color: textColorblack,
                ),
                textAlign: TextAlign.center,
              ),
              25.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    ' New Here?',
                    style: TextStyle(color: textColorGrey),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        )),
                    child: const Text(
                      ' Create Account',
                      style: TextStyle(color: pred),
                    ),
                  ),
                ],
              ),
              20.height,
              SizedBox(height: height(context, 0.05)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: height(context, 0.065),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[200],
                      ),
                      child: TextFormField(
                        controller: emailControllar,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return Utils.snackBar(
                                'Please Enter Correct Email', context);
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: 14,
                        ),
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.alternate_email, color: blackColor),
                            border: InputBorder.none,
                            hintText: 'Email Address',
                            labelStyle: TextStyle(fontSize: 14)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    20.height,
                    Stack(
                      children: [
                        Container(
                          height: height(context, 0.065),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            controller: passControllar,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Utils.snackBar(
                                    'Please Enter Correct Password', context);
                              }
                              return null;
                            },
                            style: const TextStyle(
                              color: blackColor,
                              fontSize: 14,
                            ),
                            decoration: const InputDecoration(
                                icon: Icon(Icons.lock, color: blackColor),
                                border: InputBorder.none,
                                hintText: 'Passsword',
                                labelStyle: TextStyle(fontSize: 14)),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Positioned(
                          left: width(
                            context,
                            0.75,
                          ),
                          top: height(context, 0.02),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen(),
                                )),
                            child: const Text(
                              ' Forgot?',
                              style: TextStyle(color: pred),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height(context, 0.05),
                    ),
                    CustomButton(
                      onPressed: () => handleLogin(context),
                      width: width(context, 0.75),
                      height: height(context, 0.07),
                      backgroundColor: pred,
                      text: 'login',
                      borderRadius: BorderRadius.circular(30),
                    ),
                    SizedBox(
                      height: height(context, 0.04),
                    ),
                    const Text(
                      'or login with',
                      style: TextStyle(color: textColorGrey, fontSize: 12),
                    ),
                    SizedBox(
                      height: height(context, 0.04),
                    ),
                    const Row(
                      children: [
                        IconWidget(imagePath: 'assets/google.png'),
                        IconWidget(imagePath: 'assets/fb.png'),
                        IconWidget(imagePath: 'assets/apple.png'),
                      ],
                    )
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
