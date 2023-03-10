import 'package:flutter/material.dart';
import 'package:frisz/screens/authentication/authentiction_handler.dart';
import 'package:frisz/screens/authentication/information_gathering/information_gathering.dart';
import 'package:frisz/screens/authentication/information_gathering/welcome_screen.dart';
import 'package:frisz/screens/authentication/recover_password/recover_password_screen.dart';
import 'package:frisz/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:frisz/screens/authentication/sign_up/sign_up_screen.dart';

Map<String, WidgetBuilder> routes = {
  AuthenticationHandler.name: (context) => const AuthenticationHandler(),
  RecoverPasswordScreen.name: (context) => const RecoverPasswordScreen(),
  SignInScreen.name: (context) => const SignInScreen(),
  SignUpScreen.name: (context) => const SignUpScreen(),
  WelcomeScreen.name: (context) => const WelcomeScreen(),
  InformationGathering.name: (context) => const InformationGathering(),
};
