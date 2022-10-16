import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/widgets/colors.dart';
import 'package:test2/widgets/test_exp_widget.dart';

import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RecommendedTourDetail extends StatelessWidget {
  const RecommendedTourDetail({Key? key}) : super(key: key);

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
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.audiotrack_rounded)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  // color:Colors.white,
                  child:Center(child: BigText(size:Dimensions.font26, text:'Kapaleeswarar temple',color: Colors.white,)),
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
              background: Image.asset("/images/temple0.png",
              width: double.maxFinite,
              fit:BoxFit.cover,
              )
            ) ,
          ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                  child:TestExpandedWidget(maxLines: 15,text:"Kapaleeshwarar Temple[1] is a Hindu temple dedicated to lord Shiva located in Mylapore, Chennai in the Indian state of Tamil Nadu. The form of Shiva's consort Parvati worshipped at this temple is called Karpagambal is from Tamil Goddess of the Wish-Yielding Tree. The temple was built around the 7th century CE and is an example of Dravidian architecture."
                      "According to the Puranas, Shakti worshipped Shiva in the form of a peacock, giving the vernacular name Mylai (Mayilāi) to the area that developed around the temple – mayil is Tamil for peacock.Shiva is worshiped as Kapaleeswarar, and is represented by the lingam. His consort Parvati is depicted as Karpagambal. The presiding deity is revered in the 7th-century Tamil Saiva canonical work, the Tevaram, written by Tamil saint poets known as the Nayanars and classified as Paadal Petra Sthalam."
                      "According to the Puranas, Shakti worshipped Shiva in the form of a peacock, giving the vernacular name Mylai (Mayilāi) to the area that developed around the temple – mayil is Tamil for peacock.Shiva is worshiped as Kapaleeswarar, and is represented by the lingam. His consort Parvati is depicted as Karpagambal. The presiding deity is revered in the 7th-century Tamil Saiva canonical work, the Tevaram, written by Tamil saint poets known as the Nayanars and classified as Paadal Petra Sthalam."
                      "According to the Puranas, Shakti worshipped Shiva in the form of a peacock, giving the vernacular name Mylai (Mayilāi) to the area that developed around the temple – mayil is Tamil for peacock.Shiva is worshiped as Kapaleeswarar, and is represented by the lingam. His consort Parvati is depicted as Karpagambal. The presiding deity is revered in the 7th-century Tamil Saiva canonical work, the Tevaram, written by Tamil saint poets known as the Nayanars and classified as Paadal Petra Sthalam."
                      "According to the Puranas, Shakti worshipped Shiva in the form of a peacock, giving the vernacular name Mylai (Mayilāi) to the area that developed around the temple – mayil is Tamil for peacock.Shiva is worshiped as Kapaleeswarar, and is represented by the lingam. His consort Parvati is depicted as Karpagambal. The presiding deity is revered in the 7th-century Tamil Saiva canonical work, the Tevaram, written by Tamil saint poets known as the Nayanars and classified as Paadal Petra Sthalam."),
                  margin: EdgeInsets.only(left:Dimensions.width20,right:Dimensions.width20),
                )
              ],
            )
          )
        ]
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
            left:Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
      ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconColor:Colors.white,
                    size: 24,
                    backgroundColor:AppColors.mainColor,
                    icon:Icons.remove),
                BigText(text:"\$12.88  X  10",color: AppColors.mainBlackColor,size:20),
                AppIcon(
                    iconColor:Colors.white,
                    size: 24,
                    backgroundColor:AppColors.mainColor,
                    icon:Icons.add),

              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top:Dimensions.height30,bottom:Dimensions.height30,left:Dimensions.width20,right: Dimensions.width20),
            decoration: BoxDecoration(
                color:AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(Dimensions.radius20*2),
                    topRight: Radius.circular(Dimensions.radius20)
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    size : 24
                  )
                ),
                Container(
                  padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
                  child:BigText(text: "\$10 | Add to cart",color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  )     ,
                )
              ],
            ),
          )
        ],
    ),
    );
  }
}
