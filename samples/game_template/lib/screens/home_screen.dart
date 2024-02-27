import 'package:flutter/material.dart';
import 'package:game_template/constants/strings.dart';
import 'package:game_template/screens/breath_screen.dart';
import 'package:game_template/screens/gratitude_screen.dart';
import 'package:game_template/screens/ground_screen.dart';

import 'package:game_template/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int selectedIndex = 0;
  final screens = [
   BreathScreen(),
   GroundScreen(),
   GratitudeScreen(),
SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //           title: const Text(kGameTitle),
      //   actions: [
      //     profilesDrawerBuilder(chosenProfile),
      //   ],
      // ),
      //drawer: profilesDrawer(),
            body: SafeArea(
        // IndexedStack will maintain screens in widget tree and therefore maintain state
        child: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        // backgroundColor: ,//ThemeData.,
        // selectedItemColor: ,//themedata white Colors.white,
        // unselectedItemColor: kDarkGrey,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bakery_dining_sharp),
            label: kFeed,
           // backgroundColor: kDarkGreen,
           
          ),
 BottomNavigationBarItem(
            
            icon: Icon(Icons.handshake_sharp),
            label: kHeal,
            //backgroundColor: kDarkGreen,
          ),
BottomNavigationBarItem(
            icon: Icon(Icons.wine_bar_sharp),
            label: kMind,
           // backgroundColor: kDarkGreen,
           
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications_sharp),
            label: kSettings,
          //  backgroundColor: kDarkGreen,
           
          ),
        ],
      ),
    );
    // create dinasour image with transparent background, 
    // with circle around it to  countdown a minute 
  }
}