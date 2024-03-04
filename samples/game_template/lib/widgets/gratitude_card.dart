import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_template/data/drift_db.dart';
//import 'package:intl/intl.dart';
import 'package:game_template/constants/strings.dart';
import '../src/style/palette.dart';
import 'package:provider/provider.dart';
//import 'package:drift/drift.dart' hide Column;

typedef StringCallback = void Function(String val);

class GratitudeCard extends StatelessWidget {
  final StringCallback callback;
  final TextEditingController textFieldController = TextEditingController();
  // ignore: use_key_in_widget_constructors
  GratitudeCard({required this.callback, required textFieldController});

  Widget scrollableTextField(Color cursorColor) {
    //makes textfield scrollable - wrap in Expanded widget + maxlines = null
    // TODO: fIX SIZE OF CARDS , FIX SCROLLABILITY ,
    //USED TO USE EXPANED, BUT IT SEEMS IT CANT BE USED AND STILL IT DOES NOT SCROLL
    return TextField(
controller: textFieldController,
      maxLines: null, //wrap text
      autofocus: true,
      autocorrect: true,
      cursorColor: cursorColor,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: kGameTitle,
      ),
      onSubmitted: (value) {
        print(value);
        callback(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return Consumer<GratitudesDatabase>(
      builder:
          (BuildContext context, GratitudesDatabase database, Widget? child) {
        return Card(
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: 100.0,
            height: 32.0,
            child: scrollableTextField(palette.redPen)),
        );
      },
    );
  }
}
