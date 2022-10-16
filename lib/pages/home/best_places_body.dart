import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import '../../controllers/best_places_controller.dart';

import 'package:get/get.dart';
import '../../models/products_model.dart';
import '../../widgets/app_column.dart';
import 'package:test2/widgets/big_text.dart';
import 'package:test2/widgets/icon_text_widget.dart';
import 'package:test2/widgets/small_text.dart';
import 'package:test2/utils/dimensions.dart';

import 'package:test2/widgets/colors.dart';

class BestPlacesBody extends StatefulWidget {
  const BestPlacesBody({Key? key}) : super(key: key);

  @override
  State<BestPlacesBody> createState() => _BestPlacesBodyState();
}

class _BestPlacesBodyState extends State<BestPlacesBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.screenHeight;
  @override
  void initState(){
    super.initState();
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
          GetBuilder<BestPlacesController>(builder: (popularProducts){
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
                    // Get.toNamed(RouteHelper.newyorkTour);
                    // Get.to(()=>NYTourDetail());
                  },
                  child: PageView.builder(
                      controller: pageController,
                      // itemCount: 5,
                      itemCount: popularProducts.bestPlacesList.length,
                      itemBuilder: (context,position){
                        // return _buildPageItem(position);
                        return _buildPageItem(position,popularProducts.bestPlacesList[position]);
                      }),
                )
            );
          }),
          // Container(
          //   // padding: EdgeInsets.symmetric(horizontal: 220,vertical:100),
          //     height: 220,
          //     color: Colors.white,
          //   child: PageView.builder(
          //   controller: pageController,
          //   itemCount: 5,
          //   itemBuilder: (context,position){
          //   return _buildPageItem(position);
          //   })
          // ),
          // slider section
          // Container(
          //   // color: Colors.redAccent ,
          //     height: 320,
          //     child: PageView.builder(
          //         controller: pageController,
          //         itemCount: 5,
          //         itemBuilder: (context,position){
          //           return _buildPageItem(position);
          //         })
          // ),
          // //dots
          // new DotsIndicator(
          //   dotsCount: 5,
          //   position: _currPageValue,
          //   decorator: DotsDecorator(
          //     activeColor: AppColors.mainColor,
          //     size: const Size.square(9.0),
          //     activeSize: const Size(18.0, 9.0),
          //     activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          //   ),
          // ),
        ]
    );
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
            height: 200,
            margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,top:10,bottom:10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    // image: AssetImage(
                    //     "/images/goa.jfif"
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
              height: 150,
              // margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30, bottom: 40),
              margin:EdgeInsets.only(left: 10,right:10,top:100,bottom:20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
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
