import 'package:flutter/material.dart';
import 'package:game_template/constants/strings.dart';
import 'package:game_template/screens/breath_screen.dart';
import 'package:game_template/screens/gratitude_screen.dart';
import 'package:game_template/screens/ground_screen.dart';

import 'package:game_template/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import '../src/style/palette.dart';
// Class contains 
// Scaffold -> SafeArea -> screens stack
// screen navigation - > bottomNavBar

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
        selectedItemColor: palette.trueWhite,
        unselectedItemColor: palette.darkPen,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bakery_dining_sharp),
            label: kFeed,
            //background color is here and not in the main BottomNav code
            //when type: .shifting, the item's background color 
            //supercedes the main widget one  
            backgroundColor: palette.redPen,
           
          ),
 BottomNavigationBarItem(
            
            icon: Icon(Icons.handshake_sharp),
            label: kHeal,
          ),
BottomNavigationBarItem(
            icon: Icon(Icons.wine_bar_sharp),
            label: kMind,          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications_sharp),
            label: kSettings,
           
          ),
        ],
      ),
    );
  }
}