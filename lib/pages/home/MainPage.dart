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
  bool _showBottomNavBar = true;
  static const String CARAVAGGIO = 'Caravaggio';
  static const String MONET = 'Monet';
  static const String VANGOGH = 'Van Gogh';
  static const String IMG_CARAVAGGIO = 'https://bit.ly/fl_caravaggio';
  static const String IMG_MONET = 'https://bit.ly/fl_monet';
  static const String IMG_VANGOGH = 'https://bit.ly/fl_vangogh';
  static String homeText = 'Home';
  static String searchText = 'Search';

  static String addText = 'Add';
  static String editText = 'Edit';
  static String deleteText = 'Delete';
  static String cancelText = 'Cancel';
  static String oKText = 'OK';
  static String saveText = 'Save';
  static String profile_text = 'Profile';

  List<String> menuItems = ['Settings', 'Help', 'About'];
  List<String> paths1 = [IMG_CARAVAGGIO, IMG_MONET, IMG_VANGOGH];

  @override
  Widget build(BuildContext context) {
    print("Current height is"+MediaQuery.of(context).size.height.toString());
   return Scaffold(
     appBar: AppBar(
       title: Text("Smart Tour"),
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search), onPressed: () {}),
         PopupMenuButton(
           // icon: Icon(Icons.more_vert),
           itemBuilder: (BuildContext context) {
             return menuItems.map((String item) {
               return PopupMenuItem<String>(
                 child: Text(item),
                 value: item,
               );
             }).toList();
           },
         ),
       ],

     ),
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
                     // Center(
                     //   child:   Container(
                     //       width:  Dimensions.height45,
                     //       height: Dimensions.height45,
                     //       child:Icon(Icons.search,color:Colors.white,size:Dimensions.iconSize24),
                     //       decoration:BoxDecoration(
                     //         borderRadius: BorderRadius.circular(Dimensions.radius15),
                     //         color: Colors.blue,
                     //       )
                     //   ),
                     // )
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
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     drawer: Drawer(
       elevation: 16.0,
       child: Column(
         children: <Widget>[
           UserAccountsDrawerHeader(
             accountName: const Text('LaDeep'),
             accountEmail: const Text('ladeep@ladeepai.com'),
             currentAccountPicture: CircleAvatar(
                 radius: 25.0,
                 backgroundColor: Colors.white, //const Color(0xFF778899),
                 child: Container(
                   margin: EdgeInsets.all(1.0),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     image: DecorationImage(
                         image: AssetImage("images/profile.JPG"), //NetworkImage('http://bit.ly/flutter_tiger'),
                         fit: BoxFit.cover),
                     shape: BoxShape.circle,
                   ),
                 )
             ),
             otherAccountsPictures: const <Widget>[
               CircleAvatar(
                 backgroundColor: Colors.green,
                 child: Text('LD'),
               )
             ],
           ),
           ListTile(
             title: const Text('My Tour'),
             leading: const Icon(Icons.tour_sharp),
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const MainPage()),
               );
             },
           ),
           const Divider(
             height: 0.1,
           ),
           ListTile(
             title: const Text('Best Places'),
             leading: const Icon(Icons.place_sharp),
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const MainPage()),
               );
             },
           ),
           const Divider(
             height: 0.1,
           ),
           ListTile(
             title: const Text("Near By"),
             leading: const Icon(Icons.near_me),
             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const MainPage()),
               );
             },
           ),
         ],
       ),
     ),

     bottomNavigationBar: GestureDetector(
       // onTap: ,
       onDoubleTap: () {
         _showBottomNavBar = false;
       },
       // onLongPress: ,
       // onHorizontalDragUpdate: ,
       // onVerticalDragUpdate: ,

       child: Visibility(
         visible: _showBottomNavBar,
         child: BottomNavigationBar(
           backgroundColor: Colors.blue,
           currentIndex: 1,
           // fixedColor: Colors.white,
           selectedItemColor: Colors.greenAccent,
           unselectedItemColor: Colors.white,
           items: [
             BottomNavigationBarItem(
                 label: homeText, icon: Icon(Icons.home)),
             BottomNavigationBarItem(
                 label: searchText, icon: Icon(Icons.search)),
             BottomNavigationBarItem(
                 label: profile_text, icon: Icon(Icons.photo))
           ],
           onTap: (int index) {
             print(index.toString());
           },
         ),
       ),
     ),
     backgroundColor: Colors.white,
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
