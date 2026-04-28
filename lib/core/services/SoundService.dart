import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static final AudioPlayer _bgPlayer = AudioPlayer();
  static final AudioPlayer _fxPlayer = AudioPlayer();

  static Future<void> playWin() async {
    await _fxPlayer.play(AssetSource('sounds/winsound.wav'), volume: 1.0);
  }

  static Future<void> playLose() async {
    await _fxPlayer.play(AssetSource('sounds/soundlose.wav'), volume: 1.0); // ← corregido
  }
}