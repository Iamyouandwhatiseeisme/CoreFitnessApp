import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 10),
        leadingWidth: 60,

        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: Material(
          shadowColor: Colors.black,
          shape: ShapeBorder.lerp(
            const CircleBorder(),
            const CircleBorder(),
            0.5,
          ),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: BoxBorder.all(
                color: Colors.grey.withAlpha(50),
                width: 0.5,
              ),
            ),

            child: IconButton(
              icon: Image.asset("assets/icons/Header Logo.webp"),
              onPressed: () {},
            ),
          ),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeButton(),

            SizedBox(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text("CoreFitness")],
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          LanguageButton(),

          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/profile");
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              supabase.auth.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            // child: TextButton(
            //   onPressed: () {
            //     supabase.auth.signOut();
            //   },
            //   child: Text("signout"),
            // ),
          ),
        ),
      ),
    );
  }
}
