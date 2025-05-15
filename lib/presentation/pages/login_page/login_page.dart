import 'package:core_fitness/bloc/cubit/authentication_cubit.dart';
import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // if (state is AuthenticationInitial) {
        //   debugPrint('Initial state');
        // } else if (state is AuthenticationSigningIn) {
        //   debugPrint('Signing in...');
        // } else if (state is AuthenticationSignedOut) {
        //   debugPrint('Signed out');
        //   Navigator.pushReplacementNamed(context, NavigatorClient.loginPage);
        // } else if (state is AuthenticationSignedIn) {
        //   Navigator.pushReplacementNamed(context, NavigatorClient.landingPage);
        //   debugPrint('Signed in');
        // }
        // debugPrint(state.toString());
      },
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Login.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.99),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: Colors.grey.withAlpha(80),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: LoginForm(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
