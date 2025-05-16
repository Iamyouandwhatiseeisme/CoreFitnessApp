import 'package:core_fitness/bloc/cubit/authentication_cubit.dart';
import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final supabase = Supabase.instance.client;
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
            return Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () {
                    supabase.auth.signOut();
                  },
                  child: Text("signout"),
                ),
              ),
            );
          } else if (state is AuthenticationSignInError) {
            return LoginPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
