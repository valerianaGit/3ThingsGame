import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:game_template/constants/strings.dart';

class GratitudeCard extends StatelessWidget {
    final String content;
  final DateTime date;

  const GratitudeCard({required this.content, required this.date});
  //format dates
//https://flutteragency.com/how-to-format-datetime-in-flutter/
  String dateFormatterToDateOnly(DateTime date) {
    return DateFormat('dd / MM-yyyy').format(date);
  }
  @override
  Widget build(BuildContext context) {
      return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LetterViewPage(content: content),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
 child: Card(
          elevation: 5,
          color: kDarkGreen,//Colors.purple[100],
          child: Container(
            height: 50.0,
            alignment: Alignment.center,
            child: Text(
              dateFormatterToDateOnly(date),
              style: kcardTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}