import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AudioFile extends StatefulWidget {

  final AudioPlayer advancedPlayer;
  final AssetsAudioPlayer assetsAudioPlayer;

  const AudioFile({Key? key,
    required this.advancedPlayer,
    required this.assetsAudioPlayer,
  }) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String path="https://https://github.com/rafaelreis-hotmart/Audio-Sample-files/sample2.mp3";
  late Source audioUrl = UrlSource(path);
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    print(" Audio File Dart Init state start");
    print(" Audio File Dart Init state end ==");
    print(" Audio File Dart Init state end ==");
    this.widget.advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });

    this.widget.advancedPlayer.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
    this.widget.advancedPlayer.setSourceUrl(path);

    this.widget.assetsAudioPlayer.playlistAudioFinished.listen((event) {
      setState(() {
        print(" Assset Audio Player status of listen --");
      });
    });

    }

  Widget btnStart(){
    return IconButton(
      color: Colors.yellow,
      padding: const EdgeInsets.only(bottom:10),
      // icon: isPlaying==false?Icon(_icons[0]):Icon(_icons[1]),
      icon: isPlaying==false?Icon(_icons[0]):Icon(_icons[1]),
      onPressed: (){
        if(isPlaying == false) {
          print(" Audio File Pressed--$isPlaying");
           // this.widget.assetsAudioPlayer.play(Audio("audio/statueofliberty.mp3"),);
          // AssetsAudioPlayer.playAndForget(Audio("audio/statueofliberty.mp3"),volume: 100);
          print(this.widget.assetsAudioPlayer);
          this.widget.assetsAudioPlayer.open(Audio("audio/statueofliberty.mp3"),volume: 100);
          print(" Audio File Pressed--$isPlaying");
          setState(() {
            isPlaying = true;
          });
        }else if (isPlaying == true){
          print(" Audio File Pressed--$isPlaying");
          // this.widget.advancedPlayer.pause();
          this.widget.assetsAudioPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
        // this.widget.advancedPlayer.play(audioUrl);
      },
    );
  }

  Widget loadAsset(){
    return
      Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnStart(),
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left:20,right:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              // children: [
              //
              // ],
            ),

          ),
          loadAsset(),
        ],
      )
    );
  }
}

