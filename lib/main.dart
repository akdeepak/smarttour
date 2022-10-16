import 'package:flutter/material.dart';
import 'package:test2/controllers/nearby_places_controller.dart';
import 'package:test2/controllers/ny_places_controller.dart';
import 'package:test2/pages/audio/detail_audio_page.dart';
import 'package:test2/pages/audio/player_view.dart';
import 'package:test2/pages/home/MainPage.dart';
import 'package:get/get.dart';
import 'package:test2/pages/tour/popular_tour_detail.dart';
import 'package:test2/pages/tour/recommended_tour_detail.dart';
import 'package:test2/routes/route_helper.dart';
import 'package:test2/helper/dependencies.dart' as dep;
import 'package:test2/controllers/best_places_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<PopularProductController>().getPopularProductList();
    Get.find<NearbyPlacesController>().getNearbyPlacesList();
    Get.find<NYPlacesController>().getNyPlacesList();
    Get.find<BestPlacesController>().getBestPlacesList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: PlayerView(),
      //     home: DetailAudioPage(),
          home:MainPage(),
          initialRoute: RouteHelper.initial,
          getPages:RouteHelper.routes
    );
  }
}


