import 'package:core_fitness/bloc/cubit/authentication_cubit.dart';
import 'package:core_fitness/data/get_it_methods.dart';
import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void main() {
  setUp();
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
        // home: const LoginPage(),
        routes: sl.get<NavigatorClient>().routes,
      ),
    );
  }
}
