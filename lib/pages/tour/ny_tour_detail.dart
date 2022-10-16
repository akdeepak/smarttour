import 'package:flutter/material.dart';
import 'package:test2/pages/tour/ny_detail_places.dart';
import 'package:test2/widgets/app_icon.dart';
import 'package:test2/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/ny_places_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/colors.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/small_text.dart';
import '../../widgets/test_exp_widget.dart';
import '../home/MainPage.dart';

class NYTourDetail extends StatelessWidget {
  const NYTourDetail({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body:Stack(
  //       children: [
  //         //background image
  //         Positioned(
  //             left:0,
  //             right: 0,
  //             child: Container(
  //                 width: double.maxFinite,
  //                 height:200,
  //                 // height:Dimensions.popularFoodImgSize ,
  //                 decoration:BoxDecoration(
  //                     image: DecorationImage(
  //                         fit: BoxFit.cover,
  //                         image:AssetImage(
  //                             "images/newyork.jfif"
  //                         )
  //                     )
  //                 )
  //             )),
  //         // icon widget
  //         Positioned(
  //             top:Dimensions.height45,
  //             left:Dimensions.width20,
  //             right:Dimensions.width20,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 GestureDetector(
  //                     onTap:(){
  //                       Get.to(()=> MainPage());
  //                     }, child: AppIcon(icon:Icons.arrow_back_ios)),
  //                 AppIcon(icon:Icons.shopping_cart_outlined)
  //               ],
  //             )
  //         ),
  //         // introduction of tour
  //         Positioned(
  //             left:0,
  //             right:0,
  //             bottom:0,
  //             // top:Dimensions.popularFoodImgSize -20,
  //             top:190,
  //             child:Container(
  //                 padding:EdgeInsets.only(left:20,right:20,top:20,bottom:20),
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(
  //                       topRight: Radius.circular(Dimensions.radius20),
  //                       topLeft: Radius.circular(Dimensions.radius20),
  //                     ),
  //                     color: Colors.white
  //                 ),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start ,
  //                   children: [
  //                     AppColumn(text: "New York",),
  //                     SizedBox(height: Dimensions.height20,),
  //                     BigText(text: "Introduce"),
  //                     SizedBox(height: Dimensions.height20,),
  //                     Expanded(
  //                       child: SingleChildScrollView(
  //                         child:TestExpandedWidget(maxLines:3,text:"New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square.."
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 )
  //             )
  //         ),
  //         Positioned(
  //             left:0,
  //             right:0,
  //             bottom:0,
  //             // top:Dimensions.popularFoodImgSize -20,
  //             top:390,
  //           child: Container(
  //
  //
  //             )
  //          )
  //       ],
  //     ),
  //     // bottomNavigationBar: Container(
  //     //   height: Dimensions.bottomHeightBar,
  //     //   padding: EdgeInsets.only(top:Dimensions.height30,bottom:Dimensions.height30,left:Dimensions.width20,right: Dimensions.width20),
  //     //   decoration: BoxDecoration(
  //     //       color:AppColors.buttonBackgroundColor,
  //     //       borderRadius: BorderRadius.only(
  //     //           topLeft:Radius.circular(Dimensions.radius20*2),
  //     //           topRight: Radius.circular(Dimensions.radius20)
  //     //       )
  //     //   ),
  //     //   child: Row(
  //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     //     children: [
  //     //       Container(
  //     //         padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
  //     //         decoration:BoxDecoration(
  //     //           borderRadius: BorderRadius.circular(Dimensions.radius20),
  //     //           color: Colors.white,
  //     //         ),
  //     //         child: Row(
  //     //           children: [
  //     //             Icon(Icons.remove,color:AppColors.signColor),
  //     //             SizedBox(width: Dimensions.width10/2,),
  //     //             BigText(text: '0'),
  //     //             Icon(Icons.add,color:AppColors.signColor),
  //     //             SizedBox(width: Dimensions.width10/2,),
  //     //           ],
  //     //         ),
  //     //       ),
  //     //       Container(
  //     //         padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
  //     //         child:BigText(text: "\$10 | Add to cart",color: Colors.white,),
  //     //         decoration: BoxDecoration(
  //     //           borderRadius: BorderRadius.circular(Dimensions.radius20),
  //     //           color: AppColors.mainColor,
  //     //         )     ,
  //     //       )
  //     //     ],
  //     //   ),
  //     // ),
  //   );
  // }

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
                  height:200,
                  // height:Dimensions.popularFoodImgSize ,
                  decoration:BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage(
                              "images/newyork.jfif"
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
              // top:Dimensions.popularFoodImgSize -20,
              top:190,
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
                      AppColumn(text: "New York",),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: "Introduce"),
                      SizedBox(height: Dimensions.height20,),
                      Expanded(
                        child: SingleChildScrollView(
                          child:TestExpandedWidget(maxLines:3,text:"New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square.."
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
          Positioned(
              left:0,
              right:0,
              bottom:0,
              // top:Dimensions.popularFoodImgSize -20,
              top:430,
              child: Container(
                  child: Column(
                    children: [
                      Expanded(child: SingleChildScrollView(
                        child:
                    GetBuilder<NYPlacesController>(builder:(nyPlaces) {
                      print("Get builder ---new york tour $nyPlaces.nyPlacesList.length");
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // itemCount: 10,
                          itemCount: nyPlaces.nyPlacesList.length,
                          itemBuilder: (context,index){
                            return Container(
                              margin: EdgeInsets.only(left:Dimensions.width20,right:20,bottom:10),
                              child: Row(
                                children: [
                                  // image section.
                                  Container(
                                    width:Dimensions.listViewImgSize,
                                    height:Dimensions.listViewImgSize,
                                    child: GestureDetector(
                                        onTap:(){
                                           Get.toNamed(RouteHelper.nyDetailPlaces);
                                          // Navigator.push(context,
                                          // MaterialPageRoute(builder: (context)=>NYDetailPlaces(productmodel: nyPlaces.nyPlacesList[index],))
                                          // );
                                        },
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color:Colors.white38,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            // image: AssetImage(
                                            //     "/images/temple0.png"
                                            // )
                                            image: AssetImage(
                                                nyPlaces.nyPlacesList[index].img!
                                            )
                                        )
                                    ),
                                  ),
                                  //text container
                                  Expanded(
                                      child: Container(
                                        height:Dimensions.listViewTextContSize,
                                        width: Dimensions.listViewTextContSize,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(Dimensions.radius20),
                                            bottomRight: Radius.circular(Dimensions.radius20),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              BigText(text: nyPlaces.nyPlacesList[index].name!),
                                              SizedBox(height:Dimensions.height10),
                                              SmallText(text:"Religious temple "),
                                              SizedBox(height:Dimensions.height10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconAndTextWidget(icon: Icons.circle_sharp,
                                                      text: "Religious",
                                                      iconColor: AppColors.iconColor1),
                                                  IconAndTextWidget(icon: Icons.location_on,
                                                      text: "1.7km",
                                                      iconColor: AppColors.iconColor1),
                                                  IconAndTextWidget(icon: Icons.access_time_rounded,
                                                      text: "32min",
                                                      iconColor: AppColors.iconColor1)
                                                ],
                                              )
                                            ],
                                          ) ,
                                        ),
                                      ))
                                ],
                              ),
                            );
                          });
                    })
                      ))

                    ],
                  ),

              )
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: Dimensions.bottomHeightBar,
      //   padding: EdgeInsets.only(top:Dimensions.height30,bottom:Dimensions.height30,left:Dimensions.width20,right: Dimensions.width20),
      //   decoration: BoxDecoration(
      //       color:AppColors.buttonBackgroundColor,
      //       borderRadius: BorderRadius.only(
      //           topLeft:Radius.circular(Dimensions.radius20*2),
      //           topRight: Radius.circular(Dimensions.radius20)
      //       )
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Container(
      //         padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
      //         decoration:BoxDecoration(
      //           borderRadius: BorderRadius.circular(Dimensions.radius20),
      //           color: Colors.white,
      //         ),
      //         child: Row(
      //           children: [
      //             Icon(Icons.remove,color:AppColors.signColor),
      //             SizedBox(width: Dimensions.width10/2,),
      //             BigText(text: '0'),
      //             Icon(Icons.add,color:AppColors.signColor),
      //             SizedBox(width: Dimensions.width10/2,),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         padding: EdgeInsets.only(top:Dimensions.height20,bottom:Dimensions.height20,right:Dimensions.height20),
      //         child:BigText(text: "\$10 | Add to cart",color: Colors.white,),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(Dimensions.radius20),
      //           color: AppColors.mainColor,
      //         )     ,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
