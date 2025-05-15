import 'package:core_fitness/main.dart';
import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NavigatorClient {
  // static const String authWrapper = '/';
  static const String loginPage = '/';
  static const String signUpPage = '/signup';
  static const String landingPage = '/landing';

  final Map<String, WidgetBuilder> routes = {
    // authWrapper: (context) => const AuthWrapper(),
    landingPage: (context) => const LandingPage(),
    loginPage: (context) => const LoginPage(),
    signUpPage: (context) => const SignUpPage(),
  };
}
