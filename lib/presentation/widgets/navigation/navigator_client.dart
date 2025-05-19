import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NavigatorClient {
  // static const String authWrapper = '/';
  static const String landingPage = '/';
  static const String signUpPage = '/signup';

  final Map<String, WidgetBuilder> routes = {
    landingPage: (context) => const LandingPage(),
    signUpPage: (context) => const SignUpPage(),
  };
}
