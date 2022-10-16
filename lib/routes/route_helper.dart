import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test2/pages/audio/detail_audio_page.dart';
import 'package:test2/pages/tour/ny_tour_detail.dart';
import 'package:test2/pages/tour/popular_tour_detail.dart';
import 'package:test2/pages/tour/recommended_tour_detail.dart';

import '../pages/home/MainPage.dart';
import '../pages/tour/ny_detail_places.dart';

class RouteHelper{

  static const String initial = '/';
  static const String popularTour = "/popular-tour";
  static const String newyorkTour = "/ny-tour";
  static const String recommendedTour = "/rec-tour";
  static const String nyDetailPlaces = "/ny-detail-places";
  static const String solDetailAudio = "/sol-detail-audio";

  static List<GetPage> routes = [
   GetPage(name: "/",page: ()=> MainPage()),
   GetPage(name: popularTour,page: (){
     print("Popular Tour page called ");
     return PopularTourDetail();
    }),
    // GetPage(name: newyorkTour,page: ()=> NYTourDetail()),
    GetPage(name: newyorkTour,page: (){
      print("New york Tour page called ");
      return NYTourDetail();
    }),
    GetPage(name: recommendedTour,page: (){
      print("New york Tour page called ");
      return RecommendedTourDetail();
    }),
    GetPage(name: nyDetailPlaces,page: (){
      print("New york Tour page called ");
      return NYDetailPlaces();
    }),
    GetPage(name: solDetailAudio,page: (){
      print("New york Tour page called ");
      return DetailAudioPage();
    }),
  ];
}