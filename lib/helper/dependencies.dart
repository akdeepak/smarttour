import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test2/data/api/api_client.dart';
import '../controllers/best_places_controller.dart';
import '../controllers/nearby_places_controller.dart';
import '../controllers/ny_places_controller.dart';
import '../data/repository/best_places_repo.dart';
import '../data/repository/nearby_places_repo.dart';
import '../data/repository/ny_places_repo.dart';

Future<void> init() async{
 //ApiClient.
 Get.lazyPut(() => ApiClient(appBaseUrl: "https://localhost:5000"));
 //Repos
 Get.lazyPut(() => NearbyPlacesRepo(apiClient:Get.find()));
 Get.lazyPut(() => NYPlacesRepo(apiClient:Get.find()));
 Get.lazyPut(() => BestPlacesRepo(apiClient:Get.find()));

 // Controllers
 Get.lazyPut(() => NearbyPlacesController(popularProductRepo: Get.find()));
 Get.lazyPut(() => NYPlacesController(nyProductRepo: Get.find()));
 Get.lazyPut(() => BestPlacesController(bestPlacesRepo: Get.find()));
}