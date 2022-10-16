import 'package:get/get.dart';

import '../api/api_client.dart';
//Load data from internet using the GetxService
class NearbyPlacesRepo extends GetxService {
     final ApiClient apiClient;
     NearbyPlacesRepo({required this.apiClient});

    Future<Response> getPopularProductList() async{
      return await apiClient.getData("end point url");
    }

     Future<List> getNearbyPlacesList() async{
       return await apiClient.getNearbyPlacesData();
     }


}