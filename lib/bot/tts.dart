import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static initTTS() {
    tts.setLanguage("en-US");
    // tts.setPitch(1.0);
    // tts.setSpeechRate(1.0);
    // tts.setVolume(1.0);
  }

  static speak(String text) async {
    await tts.awaitSpeakCompletion(true);

    tts.setErrorHandler((message) {
      print(message);
    });

    await stop();
    tts.speak(text);
  }

  static Future<void> stop() async {
    await tts.stop();
  }
}
