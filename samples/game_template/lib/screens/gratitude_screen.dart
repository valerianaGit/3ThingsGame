import 'package:flutter/material.dart';
import 'package:game_template/constants/strings.dart';
import 'package:game_template/data/drift_db.dart';
import 'package:game_template/widgets/gratitude_card.dart';
import 'package:drift/drift.dart' hide Column;
import '../src/style/palette.dart';
import 'package:provider/provider.dart';

// Row ->
// left side is dragon asset,
// right side a Column of 3 gratitude cards -> pregnancy journal

class GratitudeScreen extends StatefulWidget {
  const GratitudeScreen({super.key});

  @override
  State<GratitudeScreen> createState() => _GratitudeScreenState();
}

class _GratitudeScreenState extends State<GratitudeScreen> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return Consumer<GratitudesDatabase>(
      builder:
          (BuildContext context, GratitudesDatabase database, Widget? child) {
        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                // dragon asset
                Image.asset(kElfPicture),
                // SizedBox(
                //   height: 200.0,
                //   width: 80.0,
                // ),
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
            },
            tooltip: 'New entry',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

//TODO: WE DON'T NEED TO EDIT, SO FIX THIS PAGE TO ONLY BE ABLE TO CREATE LETTERS.
// Save to database . we don't need to retrieve these - so no problem with profiles
//we will only have one profile
// void saveButtonActionWith(BuildContext context, GratitudesDatabase database) {
//   if (widget.incomingText == '' && newContent != '') {
//     database.insertNewCompanionGratitude(
//       GratitudesCompanion(
//         content: Value(newContent),
//         date: Value(DateTime.now()),
//       ),
//     );

//     // Clear textfield
//     txtController.clear();
//     //TODO: ANIMATION TO SHOW THE LETTER WAS SENT

//     // // navigate to list view of notes
//     //           Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //         builder: (context) => ListViewLetters(),
//     //       ),
//     //     );
//   } else {
//     // Navigator.pop(context);
//   }
// }
