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
    return Scaffold(
body: SafeArea(
  child: Row(
    children: [
    // dragon asset
    SizedBox(height: 200.0, width: 80.0,), 
    // Column 3 gratitude 
  Column(
    //TODO: render object size missing
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GratitudeCard(),
      GratitudeCard(),
      GratitudeCard(),
    ],
  ),
    ],
  
  ),
),
floatingActionButton: FloatingActionButton(
  onPressed: () {
    //TODO: Save the context into the database when pressed 
    // maybe I can use a callback ?
    
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JournalEntryScreen(),
            ),
          );
        },,
            tooltip: 'New entry',
        child: const Icon(Icons.add),),

    )
    ;
  }
}