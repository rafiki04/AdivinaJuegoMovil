import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:AdivinaJuegoMovil/features/guess_game/domain/usecases/MakeGuess.dart';
import 'package:AdivinaJuegoMovil/features/guess_game/domain/usecases/ResetGame.dart';
import 'package:AdivinaJuegoMovil/features/guess_game/presentation/state/GameProvider.dart';
import 'package:AdivinaJuegoMovil/features/guess_game/presentation/pages/GamePage.dart';
import 'package:AdivinaJuegoMovil/features/guess_game/presentation/pages/WelcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await AudioPlayer.global.setGlobalAudioContext(
    AudioContext(
      android: AudioContextAndroid(
        audioFocus: AndroidAudioFocus.gain,
        usageType: AndroidUsageType.game,
      ),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameProvider(
        MakeGuess(),
        ResetGame(),
      )..changeDifficulty(10, 5),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}