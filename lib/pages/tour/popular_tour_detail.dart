import 'package:flutter/material.dart';
import 'package:test2/widgets/app_icon.dart';
import 'package:test2/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/colors.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/small_text.dart';
import '../../widgets/test_exp_widget.dart';
import '../home/MainPage.dart';

class PopularTourDetail extends StatelessWidget {
  const PopularTourDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          //background image
          Positioned(
              left:0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height:Dimensions.popularFoodImgSize ,
                  decoration:BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage(
                              "images/marina.jfif"
                          )
                      )
                  )
              )),
          // icon widget
          Positioned(
              top:Dimensions.height45,
              left:Dimensions.width20,
              right:Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap:(){
                        Get.to(()=> MainPage());
                      }, child: AppIcon(icon:Icons.arrow_back_ios)),
                  AppIcon(icon:Icons.shopping_cart_outlined)
                ],
              )
          ),
          // introduction of tour
          Positioned(
              left:0,
              right:0,
              bottom:0,
              top:Dimensions.popularFoodImgSize -20,
              child:Container(
                  padding:EdgeInsets.only(left:20,right:20,top:20,bottom:20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20),
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      AppColumn(text: "Marina Beach",),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: "Introduce"),
                      SizedBox(height: Dimensions.height20,),
                      Expanded(
                        child: SingleChildScrollView(
                          child:TestExpandedWidget(maxLines:3,text:"Marina Beach, or simply the Marina, is a natural urban beach in Chennai, Tamil Nadu, India, along the Bay of Bengal.The beach runs from near Fort St. George in the north to Foreshore Estate in the south, a distance of 6.0 km (3.7 mi),making it the second longest urban beach in the world, after Cox's Bazar Beach. It is a prominent landmark in Chennai.The Marina is a primarily sandy beach, with an average width of 300 m (980 ft) and the width at the widest stretch is 437 m (1,434 ft). Bathing and swimming at the Marina are legally prohibited because of the dangers, as the undercurrent is very turbulent. It is one of the most crowded beaches in the country and attracts about 30,000 visitors a day during weekdays and 50,000 visitors a day during the weekends and on holidays.During summer months, about 15,000 to 20,000 people visit the beach daily.."
                          ),
                        ),
                      )

                    ],
                  )
              )
          )

        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(Icons.remove,color:AppColors.signColor),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: '0'),
                  Icon(Icons.add,color:AppColors.signColor),
                  SizedBox(width: Dimensions.width10/2,),
                ],
              ),
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
      ),
    );
  }
}
