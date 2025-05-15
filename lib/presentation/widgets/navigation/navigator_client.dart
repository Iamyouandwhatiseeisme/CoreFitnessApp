import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NavigatorClient {
  static const String loginPage = '/';
  static const String signUpPage = 'chat_screen';

  final Map<String, WidgetBuilder> routes = {
    loginPage: (context) => const LoginPage(),
    signUpPage: (context) => const SignUpPage(),
  };
}
