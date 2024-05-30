import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softlab_project/utils/colors.dart';
import 'package:softlab_project/view/reset_password_screen.dart';
import 'package:softlab_project/view/signup_screen/final_screen.dart';

import 'package:softlab_project/view/startup_screen.dart';
import 'package:softlab_project/viewmodel/forgotpass_viewmodel.dart';
import 'package:softlab_project/viewmodel/login_viewmodel.dart';

import 'package:softlab_project/viewmodel/registration_viewmodel.dart';
import 'package:softlab_project/viewmodel/resetpass_viewmodel.dart';
import 'package:softlab_project/viewmodel/verifyotp_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistrationViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => VerifyOtpViewModel()),
        ChangeNotifierProvider(create: (_) => ResetPasswordViewModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
            useMaterial3: true,
          ),
          home: const StartUPScreeen()),
    );
  }
}
