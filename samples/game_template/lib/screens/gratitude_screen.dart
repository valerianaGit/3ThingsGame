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
  State<GratitudeScreen> createState() => GratitudeScreenState();

  static GratitudeScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<GratitudeScreenState>();
}

class GratitudeScreenState extends State<GratitudeScreen> {
  String _gratitude1 = "I am Brave";
  String _gratitude2 = "I am Enough";
  String _gratitude3 = "I am Lovable";

  set gratitude1(String value) => setState(() => _gratitude1 = value);

  set gratitude2(String value) => setState(() => _gratitude2 = value);

  set gratitude3(String value) => setState(() => _gratitude3 = value);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final TextEditingController controller = TextEditingController();
    return Consumer<GratitudesDatabase>(
      builder:
          (BuildContext context, GratitudesDatabase database, Widget? child) {
        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                // dragon asset
                SizedBox(
                  width: 100.0,
                  child: Image.asset(kDragonPicture),
                ),
                //Image(image: NetworkImage(kDragonImage),),
                // SizedBox(
                //   height: 200.0,
                //   width: 80.0,
                // ),
                // Column 3 gratitude textfields
                Column(
                  //TODO: render object size missing
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GratitudeCard(
                      callback: (val) => setState(() {
                        _gratitude1 = val;
                      }),
                      textFieldController: controller,
                    ),
                    GratitudeCard(
                      callback: (val) => setState(() {
                        _gratitude2 = val;
                      }),
                      textFieldController: controller,
                    ),
                    GratitudeCard(
                      callback: (val) => setState(() {
                        _gratitude3 = val;
                      }),
                      textFieldController: controller,
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //TODO: Save the context into the database when pressed
              database.insertNewCompanionGratitude(
                GratitudesCompanion(
                  gratitudeEntry1: Value(_gratitude1),
                  gratitudeEntry2: Value(_gratitude2),
                  gratitudeEntry3: Value(_gratitude3),
                  date: Value(DateTime.now()),
                ),
              );
              controller.clear();
            },
            tooltip: 'Save',
            child: const Icon(Icons.check),
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
