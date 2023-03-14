import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/authentiction_handler.dart';
import 'package:frisz/screens/authentication/information_gathering/information_gathering.dart';
import 'package:frisz/screens/authentication/information_gathering/welcome_screen.dart';
import 'package:frisz/screens/authentication/recover_password/recover_password_screen.dart';
import 'package:frisz/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:frisz/screens/authentication/sign_up/sign_up_screen.dart';

Map<String, WidgetBuilder> routes = {
  AuthenticationHandler.name: (context) => AuthenticationHandler(),
  RecoverPasswordScreen.name: (context) => RecoverPasswordScreen(),
  SignInScreen.name: (context) => SignInScreen(),
  SignUpScreen.name: (context) => SignUpScreen(),
  WelcomeScreen.name: (context) => WelcomeScreen(),
  InformationGathering.name: (context) => InformationGathering(),
};
