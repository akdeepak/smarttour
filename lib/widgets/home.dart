import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_tour/ui/widgets/card_widget.dart';
import 'package:smart_tour/ui/widgets/vertical_fraction_bar.dart';
import '../../ui/theme/theme.dart';

//Dashboard
//Top
//1st - Quick Links
//2nd - Deadlines, Top Matches, Recents

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showBottomNavBar = true;
  var amount = "100";
  var subtitle = "subtitle";
  var title = "title";
  var indicatorColor = AppColor.amberMaterialColor;
  double indicatorFraction = 1;

  static const String CARAVAGGIO = 'Caravaggio';
  static const String MONET = 'Monet';
  static const String VANGOGH = 'Van Gogh';
  static const String IMG_CARAVAGGIO = 'https://bit.ly/fl_caravaggio';
  static const String IMG_MONET = 'https://bit.ly/fl_monet';
  static const String IMG_VANGOGH = 'https://bit.ly/fl_vangogh';

  List<String> menuItems = [CARAVAGGIO, MONET, VANGOGH];
  List<String> paths1 = [IMG_CARAVAGGIO, IMG_MONET, IMG_VANGOGH];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    const List<Widget> mytourchildren = [
      CardWidget(),
      CardWidget(),
      ElevatedCardExample(),
      FilledCardExample(),
      OutlinedCardExample(),
    ];

    const List<Widget> nearbyplaceschildren = [
      CardWidget(),
      CardWidget(),
      // CardDet(),
      ElevatedCardExample(),
      FilledCardExample(),
      OutlinedCardExample(),
    ];

    const List<Widget> bestplaceschildren = [
      CardWidget(),
      CardWidget(),
      ElevatedCardExample(),
      FilledCardExample(),
      OutlinedCardExample(),
    ];

    const List<Widget> recentplaceschildren = [
      CardWidget(),
      CardWidget(),
      ElevatedCardExample(),
      FilledCardExample(),
      OutlinedCardExample(),
    ];

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     print('App Bar Clicked');
        //   },
        // ),
        title: Text(Constants.appName),
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
          // IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
        // flexibleSpace: SafeArea(
        //   child: Icon(
        //     Icons.camera,
        //     color: Colors.blueGrey,
        //     size: 55.0,
        //   ),
        // ),
        // bottom: PreferredSize(
        //   child: Container(
        //     color: Colors.grey,
        //     height: 75.0,
        //     width: double.infinity,
        //     child: Text('Tab 1',
        //         style: TextStyle(color: Colors.white, fontSize: 25.0)),
        //   ),
        //   preferredSize: Size.fromHeight(75.0),
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15), //const EdgeInsets.all(3),
            child: Text(
              'My Tour',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColor.secondary,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child:
                      // Column(
                      //   children: const <Widget>[
                      Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const PageScrollPhysics(), // this for snapping
                      itemCount: mytourchildren.length,
                      itemBuilder: (_, index) => mytourchildren[index],
                    ),
                  ),
                  // Spacer(),
                  // ElevatedCardExample(),
                  // FilledCardExample(),
                  // OutlinedCardExample(),
                  // Spacer(),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              'Best Places',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColor.secondary,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 9,
                  child:
                      // Column(
                      //   children: const <Widget>[
                      ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(), // this for snapping
                    itemCount: bestplaceschildren.length,
                    itemBuilder: (_, index) => bestplaceschildren[index],
                  ),
                  // Spacer(),
                  // ElevatedCardExample(),
                  // FilledCardExample(),
                  // OutlinedCardExample(),
                  // Spacer(),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0), //, //EdgeInsets.all(3),
            child: Text(
              'Nearby Places',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColor.secondary,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 9,
                  child:
                      // Column(
                      //   children: const <Widget>[
                      ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(), // this for snapping
                    itemCount: nearbyplaceschildren.length,
                    itemBuilder: (_, index) => nearbyplaceschildren[index],
                  ),
                  // Spacer(),
                  // ElevatedCardExample(),
                  // FilledCardExample(),
                  // OutlinedCardExample(),
                  // Spacer(),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15), //EdgeInsets.all(3),
            child: Text(
              'Recents',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColor.secondary,
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 10.0,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     print('Clicked Add');
      //   },
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Lawrence Rajendra Singh'),
              accountEmail: const Text('lawrencerajendrasingh@ladeepai.com'),
              currentAccountPicture: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white, //const Color(0xFF778899),
                  child: Container(
                    margin: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(Constants
                              .profilePhoto), //NetworkImage('http://bit.ly/flutter_tiger'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  )
                  // new Image.asset(
                  //   Constants.profilePhoto, //'images/profile.png',
                  // ),
                  //Used to just display initials
                  // backgroundColor: Colors.white,
                  // child: Text('LR'),
                  ),
              otherAccountsPictures: const <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text('LS'),
                )
              ],
            ),
            ListTile(
              title: const Text('Dashboard - User'),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            const Divider(
              height: 0.1,
            ),
            ListTile(
              title: const Text('Dashboard - Recruiter'),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            const Divider(
              height: 0.1,
            ),
            ListTile(
              title: const Text("Media"),
              leading: const Icon(Icons.media_bluetooth_on_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
      // persistentFooterButtons: <Widget>[
      //   ElevatedButton(
      //     //RaisedButton
      //     // elevation: 10.0,
      //     onPressed: () {
      //       print('Home');
      //     },
      //     // color: Colors.red,
      //     child: Icon(Icons.add),
      //   ),
      //   ElevatedButton(
      //     //RaisedButton
      //     // elevation: 10.0,
      //     onPressed: () {
      //       print('Search');
      //     },
      //     // color: Colors.green,
      //     child: Icon(Icons.search),
      //   ),
      // ],
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
            currentIndex: 1,
            fixedColor: Colors.lightGreen,
            items: [
              BottomNavigationBarItem(
                  label: Constants.homeText, icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: Constants.searchText, icon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  label: Constants.addText, icon: Icon(Icons.add))
            ],
            onTap: (int index) {
              print(index.toString());
            },
          ),
        ),
      ),
      backgroundColor: AppColor.primary,
    );
  }
}
