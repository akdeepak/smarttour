import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test2/controllers/nearby_places_controller.dart';
import 'package:test2/controllers/ny_places_controller.dart';
import 'package:test2/pages/tour/popular_tour_detail.dart';
import 'package:test2/routes/route_helper.dart';

import '../../models/products_model.dart';
import '../../widgets/app_column.dart';
import 'package:test2/widgets/big_text.dart';
import 'package:test2/widgets/icon_text_widget.dart';
import 'package:test2/widgets/small_text.dart';
import 'package:test2/utils/dimensions.dart';
import 'package:test2/widgets/colors.dart';

import '../tour/ny_tour_detail.dart';

class TourPageBody extends StatefulWidget {
  const TourPageBody({Key? key}) : super(key: key);

  @override
  State<TourPageBody> createState() => _TourPageBodyState();
}

class _TourPageBodyState extends State<TourPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.screenHeight;

  Future<List<dynamic>> getNearbyPlaces() async{
    List<dynamic> _popularPlacesList = [];
    final String res = await rootBundle.loadString("data/newyork_places.json");
    final dataConvertedToJSON = await json.decode(res);
    print("json dat ----- $dataConvertedToJSON");
    _popularPlacesList.add( Product.fromJson(dataConvertedToJSON).products);
    print(' Loading the data in the tour page body END');
    return _popularPlacesList;
  }

  Future<List<dynamic>> getNyPlaces() async{
    List<dynamic> _nyPlacesList = [];
    final String res = await rootBundle.loadString("data/newyork_places.json");
    final dataConvertedToJSON = await json.decode(res);
    print("json data for NY Places ----- $dataConvertedToJSON");
    _nyPlacesList.add( Product.fromJson(dataConvertedToJSON).products);
    print(' Loading the data in the tour page body END');
    return _nyPlacesList;
  }
  @override
  void initState(){
    super.initState();
    getNyPlaces();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("Curent value is "+_currPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<NearbyPlacesController>(builder: (popularProducts){
          // print(" Inside the get Builder ");
          // print(popularProducts.nearbyPlacesList);
          // print(popularProducts.nearbyPlacesList.length);
          return Container(
            // color: Colors.redAccent ,
              height: 320,
              child: GestureDetector(
                onTap: (){
                   // Get.to(()=>PopularTourDetail());
                   // Get.toNamed(RouteHelper.popularTour);
                   Get.toNamed(RouteHelper.newyorkTour);
                   // Get.to(()=>NYTourDetail());
                },
                child: PageView.builder(
                    controller: pageController,
                    // itemCount: 5,
                    itemCount: popularProducts.nearbyPlacesList.length,
                    itemBuilder: (context,position){
                    // return _buildPageItem(position);
                     return _buildPageItem(position,popularProducts.nearbyPlacesList[position]);
                    }),
              )
          );
        }),
        //dots
        GetBuilder<NearbyPlacesController>(builder: (popularProducts){
          return  DotsIndicator(
            // dotsCount: 5,
            dotsCount: popularProducts.nearbyPlacesList.isEmpty?1:popularProducts.nearbyPlacesList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //popular places
        SizedBox(height:Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width:10),
              Container(
                margin: const EdgeInsets.only(bottom:3),
                child: BigText(text:".",color: Colors.black26),
              ),
              SizedBox(width:10),
              Container(
                  margin: const EdgeInsets.only(bottom:2),
                  child: SmallText(text:"Tour places",)
              ),
            ],
          ),
        ),
        // list of tour and images
        GetBuilder<NYPlacesController>(builder:(nyPlaces) {
          print(" Ny Places Get Builder..");
          print(nyPlaces.nyPlacesList.length);
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
      ]
    ) ;
  }
  Widget _buildPageItem(int index,ProductModel popularProduct){
    Matrix4 matrix  = new Matrix4.identity();
    if(index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * ( 1 - _scaleFactor);
      var currTrans = _height * ( 1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans , 0);
    }else if ( index == _currPageValue.floor() +1){
      var currScale = _scaleFactor+(_currPageValue - index+1) * (1 - _scaleFactor);
      var currTrans = _height * ( 1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans , 0);
    }else if ( index == _currPageValue.floor() -1){
      var currScale = _scaleFactor+(_currPageValue - index+1) * (1 - _scaleFactor);
      var currTrans = _height * ( 1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans , 0);
    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    // image: AssetImage(
                    //     "/images/chennai.jfif"
                    // )
                  image: AssetImage(
                      popularProduct.img!
                  )
                )

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
           child: Container(
                height: 120,
                margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30, bottom: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0,5)
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5,0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5,0),
                      )
                    ]
                ),
             child: Container(
               padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.height15,right: Dimensions.height15),
               child: AppColumn(text: popularProduct.name!),
             ),
              ),
          )
        ],
      ),
    );
  }
}
