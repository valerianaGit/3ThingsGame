import 'package:flutter/material.dart';
import 'package:game_template/constants/strings.dart';
import 'package:game_template/widgets/gratitude_card.dart';

// Row ->
// left side is dragon, 
// right side a Column of 3 gratitude cards -> pregnancy journal

class GratitudeScreen extends StatelessWidget {
  const GratitudeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
body: Row(
  children: [
  // dragon asset
  SizedBox(height: null, width: 80.0,), 
  // Column 3 gratitude 
Column(
  children: [
    GratitudeCard(),
    GratitudeCard(),
    GratitudeCard(),
  ],
),
  ],

),
//TODO: FLOATING ACTION BUTTON - to store the gratitudes -> pregnancy journal 
    )
    ;
  }
}