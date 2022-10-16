import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/models/products_model.dart';
import 'package:test2/pages/audio/detail_audio_page.dart';
import 'package:test2/routes/route_helper.dart';
import 'package:test2/widgets/colors.dart';
import 'package:test2/widgets/test_exp_widget.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../home/MainPage.dart';

class NYDetailPlaces extends StatelessWidget {
 final List<dynamic>? productmodel;

  const NYDetailPlaces({Key? key,
    this.productmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:CustomScrollView(
        slivers:[
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:(){
                      Get.toNamed(RouteHelper.initial);
                    }, child: AppIcon(icon:Icons.arrow_back_ios)),
                    GestureDetector(
                      onTap:(){
                          // print(" play the audio tracker record...");
                          // AssetsAudioPlayer.playAndForget(Audio("audio/statueofliberty.mp3"),);
                          //  Get.toNamed(RouteHelper.solDetailAudio);
                        Get.to(DetailAudioPage());
                      },child:AppIcon(icon: Icons.audiotrack_rounded)),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  // color:Colors.white,
                  child:Center(child: BigText(size:Dimensions.font26, text:'Statue Of Liberty',color: Colors.white,)),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top:5,bottom:10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight:Radius.circular(Dimensions.radius20),
                    )
                  ),
                )

            ),
            pinned: true,
            backgroundColor: Colors.blue,
            expandedHeight: 150,
            flexibleSpace:FlexibleSpaceBar(
              background: Image.asset("/images/sol.jfif",
              width: double.maxFinite,
              fit:BoxFit.cover,
              )
            ) ,
          ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                  child:TestExpandedWidget(maxLines: 15,text:"She is an icon, a national treasure, and one of the most recognizable figures in the world. Each year millions who cherish her ideals make the journey to experience her history and grandeur in person. She is the Statue of Liberty, a symbol of freedom, inspiration, and hope."),
                  margin: EdgeInsets.only(left:Dimensions.width20,right:Dimensions.width20),
                )
              ],
            )
          )
        ]
      ),
    //   bottomNavigationBar: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Container(
    //         padding: EdgeInsets.only(
    //         left:Dimensions.width20*2.5,
    //         right: Dimensions.width20*2.5,
    //           top: Dimensions.height10,
    //           bottom: Dimensions.height10,
    //   ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             AppIcon(
    //                 iconColor:Colors.white,
    //                 size: 24,
    //                 backgroundColor:AppColors.mainColor,
    //                 icon:Icons.remove),
    //             BigText(text:"\$12.88  X  10",color: AppColors.mainBlackColor,size:20),
    //             AppIcon(
    //                 iconColor:Colors.white,
    //                 size: 24,
    //                 backgroundColor:AppColors.mainColor,
    //                 icon:Icons.add),
    //
    //           ],
    //         ),
    //       ),
    //       Container(
    //         height: Dimensions.bottomHeightBar,
    //         padding: EdgeInsets.only(top:Dimensions.height30,bottom:Dimensions.height30,left:Dimensions.width20,right: Dimensions.width20),
    //         decoration: BoxDecoration(
    //             color:AppColors.buttonBackgroundColor,
    //             borderRadius: BorderRadius.only(
    //                 topLeft:Radius.circular(Dimensions.radius20*2),
    //                 topRight: Radius.circular(Dimensions.radius20)
    //             )
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Container(
    //               padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
    //               decoration:BoxDecoration(
    //                 borderRadius: BorderRadius.circular(Dimensions.radius20),
    //                 color: Colors.white,
    //               ),
    //               child: Icon(
    //                 Icons.favorite,
    //                 color: AppColors.mainColor,
    //                 size : 24
    //               )
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
    //               child:BigText(text: "\$10 | Add to cart",color: Colors.white,),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(Dimensions.radius20),
    //                 color: AppColors.mainColor,
    //               )     ,
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    // ),
    );
  }
}
