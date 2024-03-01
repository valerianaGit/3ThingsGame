import 'package:flutter/material.dart';
import 'package:game_template/data/drift_db.dart';
//import 'package:intl/intl.dart';
import 'package:game_template/constants/strings.dart';
import '../src/style/palette.dart';
import 'package:provider/provider.dart';
//import 'package:drift/drift.dart' hide Column;

class GratitudeCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  GratitudeCard({this.incomingText = ''});

  String incomingText = '';

  String newContent = '';

  var txtController = TextEditingController();

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
                  width: 50.0,
                  height: 16.0,
                ),
        
                Container(
                  height: 32.0, // we'll see if it can still scroll with this container widget
                  child: scrollableTextField(palette.redPen),),
            
                const SizedBox(
                  width: 50.0, 
                  height: 16.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
