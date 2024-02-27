import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:game_template/constants/strings.dart';
import '../src/style/palette.dart';
import 'package:provider/provider.dart';

class GratitudeCard extends StatefulWidget {
  String incomingText = '';
  // ignore: use_key_in_widget_constructors
  GratitudeCard({this.incomingText = ''});

  @override
  State<GratitudeCard> createState() => _GratitudeCardState();
}

class _GratitudeCardState extends State<GratitudeCard> {
  String newContent = '';
  var txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    // 4 - declare final constant to use providers
    final database = ref.watch(santaDBProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 32.0,
              ),

              getWidget(),

              const SizedBox(
                height: 16.0,
              ),
              getSaveButtonWidgetWith(context, database, profile),
              // TODO: DELETE THIS button to view the ddatabase
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
      ),
    );
  }

  Widget getSaveButtonWidgetWith(BuildContext context, SantaDatabase database) {
    if (widget.incomingText == '') {
      return ElevatedButton(
        child: const Text(kSave),
        onPressed: () {
          saveButtonActionWith(context, database, profile);
        },
      );
    } else {
      return const SizedBox(
        height: 16.0,
      );
    }
  }

  Widget getWidget() {
    if (widget.incomingText == '') {
      return Expanded(
        child: scrollableTextField(),
      );
    } else {
      return Expanded(
        child: scrollableTextView(),
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

  TextField scrollableTextField(Color cursorColor) {
    //makes textfield scrollable - wrap in Expanded widget + maxlines = null
    return TextField(
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
    );
  }

//TODO: WE DON'T NEED TO EDIT, SO FIX THIS PAGE TO ONLY BE ABLE TO CREATE LETTERS.
// Save to database . we don't need to retrieve these - so no problem with profiles
//we will only have one profile 
  void saveButtonActionWith(BuildContext context, SantaDatabase database) {
    if (widget.incomingText == '' && newContent != '') {
//TODO: UPDATE THIS postcompanion to store correct values for SENDER AND RECEIVER
      database.insertNewCompanionPost(
        PostsCompanion(
          sender: Value(profile.sender),
          receiver: Value(
              kAgot), //TODO: UNLESS WE CREATE PARENT PROFILES AND PARENT CAN CHOSE WHICH CHILD PROFILE TO WRITE TO, THEY ALL NEED TO GO TO agot
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
}
