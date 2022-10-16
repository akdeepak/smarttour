import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/pages/home/tour_page_body.dart';
import 'package:test2/utils/dimensions.dart';
import 'package:test2/widgets/big_text.dart';
import 'package:test2/widgets/colors.dart';

import 'best_places_body.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is"+MediaQuery.of(context).size.height.toString());
   return Scaffold(
     body: Stack(
       children: [
         Column(
           children: [
             Container(
               child:Container(
                 margin: EdgeInsets.only(top:5,bottom: 5),
                 padding: EdgeInsets.only(left:20,right: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                         BigText(text:"Best Places",color:AppColors.mainColor,size: 24,),
                         // Row(
                         //   children: [
                         //     SmallText(text:"Chennai",color:Colors.black54),
                         //     Icon(Icons.arrow_drop_down_rounded),
                         //   ],
                         // )

                       ],
                     ),
                     Center(
                       child:   Container(
                           width:  Dimensions.height45,
                           height: Dimensions.height45,
                           child:Icon(Icons.search,color:Colors.white,size:Dimensions.iconSize24),
                           decoration:BoxDecoration(
                             borderRadius: BorderRadius.circular(Dimensions.radius15),
                             color: Colors.blue,
                           )
                       ),
                     )
                   ],
                 ),
               ),
             ),
             Expanded(child: SingleChildScrollView(
               child:BestPlacesBody(),
             )),
             Container(
               child:Container(
                 margin: EdgeInsets.only(top:1,bottom:15),
                 padding: EdgeInsets.only(
                     left:Dimensions.width20,
                     right: Dimensions.width20),

                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                         BigText(text:"Near By",color:AppColors.mainColor,size: 24,),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
             //Showing body..
             Expanded(child: SingleChildScrollView(
               child:TourPageBody(),
             ))
           ],
         ),

       ],
     ),
     // Column(
     //   children: [
     //     Container(
     //       child:Container(
     //         margin: EdgeInsets.only(top:Dimensions.height45,bottom: Dimensions.height15),
     //         padding: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
     //         child: Row(
     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
     //           children: [
     //             Column(
     //               children: [
     //                 BigText(text:"Best Places",color:AppColors.mainColor,size: 24,),
     //                 // Row(
     //                 //   children: [
     //                 //     SmallText(text:"Chennai",color:Colors.black54),
     //                 //     Icon(Icons.arrow_drop_down_rounded),
     //                 //   ],
     //                 // )
     //
     //               ],
     //             ),
     //             Center(
     //               child:   Container(
     //                   width:  Dimensions.height45,
     //                   height: Dimensions.height45,
     //                   child:Icon(Icons.search,color:Colors.white,size:Dimensions.iconSize24),
     //                   decoration:BoxDecoration(
     //                     borderRadius: BorderRadius.circular(Dimensions.radius15),
     //                     color: Colors.blue,
     //                   )
     //               ),
     //             )
     //           ],
     //         ),
     //       ),
     //     ),
     //     //Showing body..
     //     Expanded(child: SingleChildScrollView(
     //       child:TourPageBody(),
     //     ))
     //   ],
     // ),
   );
  }
}
