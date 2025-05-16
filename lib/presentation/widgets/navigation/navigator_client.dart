import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NavigatorClient {
  // static const String authWrapper = '/';
  static const String landingPage = '/';
  static const String signUpPage = '/signup';
  static const String loginPage = '/landing';

  final Map<String, WidgetBuilder> routes = {
    landingPage: (context) => const LandingPage(),
    loginPage: (context) => const LoginPage(),
    signUpPage: (context) => const SignUpPage(),
  };
}
