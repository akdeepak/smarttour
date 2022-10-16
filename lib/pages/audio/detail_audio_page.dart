import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test2/pages/audio/audio_file.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({Key? key}) : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {

  late AudioPlayer _advancedPlayer;
  late AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState(){
    super.initState();
     _advancedPlayer = new AudioPlayer();
     _assetsAudioPlayer = new AssetsAudioPlayer();
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight  = MediaQuery.of(context).size.height;
    final double screenWidth  = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        children: [
            Positioned(
              top:0,
                left:0,
                right:0,
                height: screenHeight/3,
                child: Container(
                color:Colors.blue,
                )),
            Positioned(
              top:0,left:0,right:0,
              child:
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.nyDetailPlaces);
                }, child:AppBar(
                leading: IconButton(
                  icon:Icon(Icons.arrow_back_ios,),
                  onPressed: (){
                    Get.toNamed(RouteHelper.nyDetailPlaces);
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation:0.0,
              )
            ),
            ),
            Positioned(
              top: screenHeight * 0.2,left:0,right:0,
              height:screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color:Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height:screenHeight*0.1,),
                    Text("Statue Of Liberty",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir",
                      ),
                    ),
                    Text("United States Of America",
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                    AudioFile(advancedPlayer: _advancedPlayer,assetsAudioPlayer: _assetsAudioPlayer,)
                  ],
                )
              )
            ),
            Positioned(
              top: 30 ,
              left: (screenWidth-150)/2,
              right: (screenWidth-150)/2,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color:Colors.white,width:2),
                  color:Colors.greenAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:Colors.white,width:5),
                      image: DecorationImage(
                        image: AssetImage("images/sol.jfif"),
                        fit:BoxFit.cover,
                      )
                    ),
                  ),
                ),
              ),
            )
        ],
      )
    );
  }
}
