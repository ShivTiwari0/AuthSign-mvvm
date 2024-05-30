import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:softlab_project/res/apptheme.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/utils/common.dart';
import 'package:softlab_project/utils/const.dart';
import 'package:softlab_project/utils/int_extensions.dart';
import 'package:softlab_project/utils/utils.dart';

import 'package:softlab_project/view/login_screen.dart';

import 'package:softlab_project/view/widget/textfield.dart';
import 'package:softlab_project/viewmodel/resetpass_viewmodel.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.token});
  final String token;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController passControllar = TextEditingController();
    final TextEditingController cpassControllar = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    @override
    void dispose() {
      cpassControllar.dispose();
      passControllar.dispose();
      super.dispose();
    }

    Future<void> resetPassword(context) async {
      if (_formKey.currentState!.validate()) {
        final viewModel =
            Provider.of<ResetPasswordViewModel>(context, listen: false);
        final response = await viewModel.resetPassword(
            widget.token, passControllar.text, cpassControllar.text);

        if (response['success'] == true) {
          Utils.toastMessage(response['message']);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          Utils.snackBar(response['message'], context);
        }
      }
    }

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
                'Reset Password',
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
              20.height,
              SizedBox(height: height(context, 0.05)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        controller: passControllar,
                        validator: (value) {
                          if (value!.isEmpty || value != cpassControllar.text) {
                            return Utils.toastMessage(
                                'Please Enter Valid Password');
                          }
                          return null;
                        },
                        icon: Icons.lock_outline,
                        hintText: 'New Password'),
                    20.height,
                    CustomFormField(
                        controller: cpassControllar,
                        icon: Icons.lock_outline,
                        validator: (value) {
                          if (value!.isEmpty || value != passControllar.text) {
                            return Utils.toastMessage(
                                'Please Enter Valid Password');
                          }
                          return null;
                        },
                        hintText: 'Confirm New Password'),
                    SizedBox(
                      height: height(context, 0.05),
                    ),
                    CustomButton(
                      onPressed: () {
                        resetPassword(context);
                      },
                      width: width(context, 0.75),
                      height: height(context, 0.07),
                      backgroundColor: pred,
                      text: 'Submit',
                      borderRadius: BorderRadius.circular(30),
                    ),
                    SizedBox(
                      height: height(context, 0.04),
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
