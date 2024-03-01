import 'package:flutter/material.dart';
import 'package:game_template/constants/strings.dart';
import '../src/style/palette.dart';
import 'package:provider/provider.dart';

class GroundScreen extends StatelessWidget {
  const GroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final palette = context.watch<Palette>();
    return Scaffold(
      backgroundColor: palette.trueWhite,
      body: Image.asset(kElfPicture),
    );
  }
}