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
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // if (state is AuthenticationSignedOut) {
        //   Navigator.pushReplacementNamed(context, NavigatorClient.loginPage);
        // }
      },
      child: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              supabase.auth.signOut();
            },
            child: Text("signout"),
          ),
        ),
      ),
    );
  }
}
