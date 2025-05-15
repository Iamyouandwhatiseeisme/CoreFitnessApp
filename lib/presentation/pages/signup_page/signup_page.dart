import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(
                      color: Colors.grey.withAlpha(80),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: TextFormField(
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
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20.0,
                              ),
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
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  NavigatorClient.loginPage,
                                );
                              },
                              child: Text('Log in'),
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
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.grey.withAlpha(70),
                              backgroundColor: Colors.grey.withAlpha(80),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            onPressed: () {},
                            label: Text(
                              "Sign in with Google",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withAlpha(200),
                              ),
                            ),
                            // icon: Icon(SimpleIcons.google),
                            icon: SvgPicture.asset(
                              'assets/icons/google.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.grey.withAlpha(70),
                              backgroundColor: Colors.grey.withAlpha(80),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 10,
                              ),
                            ),
                            onPressed: () {},
                            label: Text(
                              "Sign in with Github",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withAlpha(200),
                              ),
                            ),
                            icon: SvgPicture.asset(
                              'assets/icons/github.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
