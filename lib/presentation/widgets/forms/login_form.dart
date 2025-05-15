import 'package:core_fitness/bloc/cubit/authentication_cubit.dart';
import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _passwordTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Logging in...')));
    }
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: TextFormField(
              controller: _emailTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.withAlpha(40),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.withAlpha(40),
                    width: 2,
                  ),
                ),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20.0),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.grey.withAlpha(70),
                    backgroundColor: Colors.blue.withAlpha(80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    _submit();
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    NavigatorClient.signUpPage,
                  );
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   NavigatorClient.signUpPage,
                  // );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.withAlpha(50),
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Or login with")],
          ),
          OauthButton(
            text: "Sign in with Google",
            icon: SvgPicture.asset(
              'assets/icons/google.svg',
              width: 40,
              height: 40,
            ),
            onPressed: () {},
          ),

          SizedBox(height: 10),
          OauthButton(
            text: "Sign in with Github",
            icon: SvgPicture.asset(
              'assets/icons/github.svg',
              width: 40,
              height: 40,
            ),
            onPressed: () async {
              // BlocProvider.of<AuthenticationCubit>(context)
              //     .signInWithGithub();
              Supabase.instance.client.auth.signInWithOAuth(
                OAuthProvider.github,
                redirectTo: 'corefitness://login-callback',
                authScreenLaunchMode: LaunchMode.externalApplication,
              );

              final currentUser = Supabase.instance.client.auth.currentUser;
              debugPrint(currentUser?.email);
            },
          ),
        ],
      ),
    );
  }
}
