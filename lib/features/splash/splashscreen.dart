import 'package:aqra/core/assets/assets.dart';
import 'package:aqra/features/home/ui/home_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _audioPlayer.setAsset(Assets.audioSplash);
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    playAudio();
    return EasySplashScreen(
      showLoader: false,
      logoSize: 0,
      logo: Image.asset(Assets.splashScreen),
      backgroundImage: AssetImage(Assets.splashScreen),
      navigator: HomePage(),
      durationInSeconds: 5,
    );
  }

  playAudio() {
    _audioPlayer.play();
    return 1;
  }
}
