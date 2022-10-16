import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TourAudioPlayer extends StatefulWidget {
  TourAudioPlayer({Key? key}) : super(key: key);



  @override
  State<TourAudioPlayer> createState() => _TourAudioPlayerState();
}



class _TourAudioPlayerState extends State<TourAudioPlayer> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
