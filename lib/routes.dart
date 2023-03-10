
import 'package:flutter/widgets.dart';

import 'package:riders_app/screens/complete_profile/complete_profile_screen.dart';


import 'package:riders_app/screens/home/home_screen.dart';
import 'package:riders_app/screens/login_success/login_success_screen.dart';
import 'package:riders_app/screens/otp/otp_screen.dart';

import 'package:riders_app/screens/sign_in/sign_in_screen.dart';
import 'package:riders_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),

  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),


};
