// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../src/in_app_purchase/in_app_purchase.dart';
import '../src/player_progress/player_progress.dart';
import '../src/style/palette.dart';
import '../src/style/responsive_screen.dart';
import '../src/settings/custom_name_dialog.dart';
import '../src/settings/settings.dart';
//import 'package:game_template/constants/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.darkestGrayBackground,
      body: ResponsiveScreen(
        squarishMainArea: ListView(
          children: [
            _gap,
            Text(
              AppLocalizations.of(context)!.breathInstructions,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Permanent Marker',
                fontSize: 55,
                height: 1,
              ),
            ),
            _gap,
             _NameChangeLine(
              AppLocalizations.of(context)!.name, 
            ),
            // ValueListenableBuilder<bool>(
            //   valueListenable: settings.soundsOn,
            //   builder: (context, soundsOn, child) => _SettingsLine(
            //     kSoundFX,
            //     Icon(color: palette.trueWhite, soundsOn ? Icons.graphic_eq : Icons.volume_off),
            //     onSelected: () => settings.toggleSoundsOn(),
            //   ),
            // ),
            ValueListenableBuilder<bool>(
              valueListenable: settings.musicOn,
              builder: (context, musicOn, child) => _SettingsLine(
                AppLocalizations.of(context)!.music,
                
                Icon(color: palette.trueWhite, musicOn ? Icons.music_note : Icons.music_off),
                onSelected: () => settings.toggleMusicOn(),
              ),
            ),
            Consumer<InAppPurchaseController?>(
                builder: (context, inAppPurchase, child) {
              if (inAppPurchase == null) {
                // In-app purchases are not supported yet.
                // Go to lib/main.dart and uncomment the lines that create
                // the InAppPurchaseController.
                return const SizedBox.shrink();
              }

              Widget icon;
              VoidCallback? callback;
              if (inAppPurchase.adRemoval.active) {
                icon = const Icon(Icons.check);
              } else if (inAppPurchase.adRemoval.pending) {
                icon = const CircularProgressIndicator();
              } else {
                icon = const Icon(Icons.ad_units);
                callback = () {
                  inAppPurchase.buy();
                };
              }
              return _SettingsLine(
                AppLocalizations.of(context)!.removeAds,
                icon,
                onSelected: callback,
              );
            },),
            _SettingsLine(
              AppLocalizations.of(context)!.resetProgress,
              const Icon(Icons.delete, color:Colors.white,),
              onSelected: () {
                context.read<PlayerProgress>().reset();

                final messenger = ScaffoldMessenger.of(context);
                messenger.showSnackBar(
                  const SnackBar(
                      content: Text(AppLocalizations.of(context)!.playerProgressReset)),
                );
              },
            ),
            _gap,
          ],
        ),
        rectangularMenuArea: Center(child: const Text(AppLocalizations.of(context)!.gameTitle, 
                        style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 25.0,
                  color: Colors.white,
                ))),
     
      ),
    );
  }
}

class _NameChangeLine extends StatelessWidget {
  final String title;

  const _NameChangeLine(this.title);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: () => showCustomNameDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 30,
                  color: Colors.white,
                )),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: settings.playerName,
              builder: (context, name, child) => Text(
                '‘$name’',
                style: const TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsLine extends StatelessWidget {
  final String title;

  final Widget icon;

  final VoidCallback? onSelected;

  const _SettingsLine(this.title, this.icon, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
