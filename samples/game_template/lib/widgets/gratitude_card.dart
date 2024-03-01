import 'package:flutter/material.dart';
import 'package:game_template/data/drift_db.dart';
//import 'package:intl/intl.dart';
import 'package:game_template/constants/strings.dart';
import '../src/style/palette.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' hide Column;

class GratitudeCard extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  GratitudeCard({this.incomingText = ''});

  String incomingText = '';

  @override
  State<GratitudeCard> createState() => _GratitudeCardState();
}

class _GratitudeCardState extends State<GratitudeCard> {
  String newContent = '';
  var txtController = TextEditingController();

  Widget getSaveButtonWidgetWith(
      BuildContext context, GratitudesDatabase database) {
    if (widget.incomingText == '') {
      return ElevatedButton(
        child: const Text(kSave),
        onPressed: () {
          saveButtonActionWith(context, database);
        },
      );
    } else {
      return const SizedBox(
        height: 16.0,
      );
    }
  }

  Widget getWidget(Color borderColor, Color cursorColor) {
    if (widget.incomingText == '') {
      return Expanded(
        child: scrollableTextField(borderColor),
      );
    } else {
      return Expanded(
        child: scrollableTextView(cursorColor),
      );
    }
  }

  SingleChildScrollView scrollableTextView(Color borderColor) {
    return SingleChildScrollView(
      //scrollable Text - > wrap in SingleChildScrollView -> wrap that in Expanded
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.incomingText,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }

  Widget scrollableTextField(Color cursorColor) {
    //makes textfield scrollable - wrap in Expanded widget + maxlines = null
    return Expanded(
      child: TextField(
        controller: txtController,
        maxLines: null, //wrap text
        autofocus: true,
        autocorrect: true,
        cursorColor: cursorColor,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: kGameTitle,
        ),
        onChanged: (newValue) {
          newContent = newValue;
        },
      ),
    );
  }

//TODO: WE DON'T NEED TO EDIT, SO FIX THIS PAGE TO ONLY BE ABLE TO CREATE LETTERS.
// Save to database . we don't need to retrieve these - so no problem with profiles
//we will only have one profile
  void saveButtonActionWith(BuildContext context, GratitudesDatabase database) {
    if (widget.incomingText == '' && newContent != '') {
      database.insertNewCompanionGratitude(
        GratitudesCompanion(
          content: Value(newContent),
          date: Value(DateTime.now()),
        ),
      );

      // Clear textfield
      txtController.clear();
      //TODO: ANIMATION TO SHOW THE LETTER WAS SENT

      // // navigate to list view of notes
      //           Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => ListViewLetters(),
      //       ),
      //     );
    } else {
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return Consumer<GratitudesDatabase>(
      builder: (BuildContext context, GratitudesDatabase database, Widget? child){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 50.0, //TODO: MISSING CONSTARINT
                  height: 32.0,
                ),
            
                //getWidget(palette.redPen, palette.darkPen),
                scrollableTextField(palette.redPen),
            
                const SizedBox(
                  width: 50.0, // TODO: MISSING CONSTRAINT 
                  height: 16.0,
                ),
                getSaveButtonWidgetWith(context, database),
                // DELETE THIS button to view the ddatabase
                // ElevatedButton(
                //   child: const Text('Check database'),
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => DriftDbViewer(database),
                //         ),
                //         );
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
