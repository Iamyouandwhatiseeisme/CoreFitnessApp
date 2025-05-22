import 'package:core_fitness/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';

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
      appBar: AppbarWithHamburgerMenu(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Welcome to CoreFitness",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarWithHamburgerMenu extends StatefulWidget
    implements PreferredSizeWidget {
  const AppbarWithHamburgerMenu({super.key});

  @override
  State<AppbarWithHamburgerMenu> createState() =>
      _AppbarWithHamburgerMenuState();

  @override
  Size get preferredSize => Size.fromHeight(300);
}

class _AppbarWithHamburgerMenuState extends State<AppbarWithHamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          actions: [LanguageButton(), ThemeButton()],
          leading: Container(
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
          floating: true,
          snap: true,

          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SizedBox(child: const Text("CoreFitness"))],
            ),

            centerTitle: true,
            background: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              spacing: 10,

              children: [
                Icon(Symbols.fitness_center),
                Icon(Symbols.post),
                Icon(Symbols.shop),
                Icon(Symbols.orders_sharp),
                Icon(Symbols.person_filled_sharp),
                Icon(Symbols.home),
              ],
            ),
          ),
        ),
      ],
      body: Container(),

      // child: AppBar(
      //   elevation: 20,
      //   actionsPadding: const EdgeInsets.only(right: 10),
      //   leadingWidth: 60,

      //   toolbarHeight: 80,
      // leading: Container(
      //   margin: const EdgeInsets.all(2),
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     border: BoxBorder.all(
      //       color: Colors.grey.withAlpha(50),
      //       width: 0.5,
      //     ),
      //   ),

      //   child: IconButton(
      //     icon: Image.asset("assets/icons/Header Logo.webp"),
      //     onPressed: () {},
      //   ),
      // ),
      // flexibleSpace: FlexibleSpaceBar(
      //   titlePadding: EdgeInsets.all(22),
      //   centerTitle: true,
      // title: Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ThemeButton(),

      //         SizedBox(
      //           height: 40,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [const Text("CoreFitness")],
      //           ),
      //         ),
      //       ],
      //     ),
      // if (isMenuOpen) ...[
      //   const SizedBox(height: 8),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: const [
      //       Text("Menu Item 1"),
      //       SizedBox(width: 16),
      //       Text("Menu Item 2"),
      //     ],
      //   ),
      // ],
      // ],
      // ),
      // background: Container(decoration: BoxDecoration()),
      // ),
      // title: Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ThemeButton(),

      //         SizedBox(
      //           height: 80,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [const Text("CoreFitness")],
      //           ),
      //         ),
      //       ],
      //     ),
      //     if (isMenuOpen) ...[
      //       const SizedBox(height: 8),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: const [
      //           Text("Menu Item 1"),
      //           SizedBox(width: 16),
      //           Text("Menu Item 2"),
      //         ],
      //       ),
      //     ],
      //   ],
      // ),
      // centerTitle: true,
      // actions: [
      //   LanguageButton(),

      //   IconButton(
      //     iconSize: 40,
      //     icon: const Icon(Icons.menu_outlined),
      //     onPressed: _toggleMenu,
      //   ),
      // ],
    );
  }
}
