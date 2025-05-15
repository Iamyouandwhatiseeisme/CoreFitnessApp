import 'package:core_fitness/bloc/cubit/authentication_cubit.dart';
import 'package:core_fitness/data/get_it_methods.dart';
import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUp();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthenticationCubit())],
      child: MaterialApp(
        title: 'CoreFitness',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: sl.get<NavigatorClient>().routes,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {},
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is AuthenticationInitial) {
            return const LoginPage();
          } else if (state is AuthenticationSigningIn) {
            return const LandingPage();
          } else if (state is AuthenticationSignedOut) {
            return const LoginPage();
          } else if (state is AuthenticationSignInError) {
            return const LoginPage();
          }
          return const LandingPage();
        },
      ),
    );
  }
}
