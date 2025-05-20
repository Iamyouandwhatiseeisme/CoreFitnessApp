import 'package:core_fitness/bloc/cubit/authentication_cubit.dart';
import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("landing page");
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSignInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              duration: const Duration(seconds: 2),
            ),
          );
        }
        if (state is AuthenticationSignedIn) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Signed in successfully!"),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationSignedIn) {
            debugPrint("signed instate");
            return DashBoard();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
