import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../src/style/palette.dart';
import 'package:game_template/constants/strings.dart';
import 'package:audioplayers/audioplayers.dart';

//TODO: CREATE string constants here

class TimerClock extends StatefulWidget {
  const TimerClock({super.key});

  @override
  State<TimerClock> createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;
  bool startPause = true;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  double get timerDouble {
    double timer = currentSeconds.toDouble() / timerMaxSeconds.toDouble();
    return timer;
  }

  String get meditationButtonText {
    String text = '';
    setState(() {
      if (startPause == false) {
        text = 'Restart Meditation';
      } else {
        text = 'Start Meditation';
      }
    });
    return text;
  }

  Icon get getIcon {
    Icon icon = Icon(Icons.play_arrow);
    setState(() {
      if (startPause == false) {
        icon = Icon(Icons.replay_rounded);
      } else {
        icon = Icon(Icons.play_arrow);
      }
    });
    return icon;
  }

  startTimeout([int milliseconds = 100]) {
            AudioPlayer player = AudioPlayer();
                     
    var duration = interval;
    startPause = !startPause;
    print('pause $startPause');
    Timer.periodic(duration, (timer) {
      setState(() {
        if (startPause == false) {
           player.play(AssetSource(kBreathingSoundByte));
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        } else {
          currentSeconds = 0;
          player.stop();
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          kMeditation,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Permanent Marker',
            fontSize: 28.0,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 16.0, left: 64.0, right: 64.0, bottom: 32.0),
                child: Text(
                  kBreathingInstructions, // TODO: HAVE GEMINI add something by remi here
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: palette.trueWhite,
                  ),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 300.0,
                    width: 300.0,
                    child: CircularProgressIndicator(
                      backgroundColor:
                          palette.accentDeepPurple, // time left color
                      color:
                          palette.darkestGrayBackground, // time passed color -
                      value: timerDouble,
                      semanticsLabel: timerText,
                    ),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Image.asset(kDragonPicture),
                  ),
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              Text(
                timerText,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: palette.trueWhite),
              ),
              SizedBox(
                height: 16.0,
              ),
              ClipOval(
                child: Material(
                  color: palette.accentDeepPurple, // button color
                  child: InkWell(
                    splashColor: palette.purplePink, // inkwell color
                    child: SizedBox(width: 60.0, height: 60.0, child: getIcon),
                    onTap: () {
              
                      startTimeout();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
