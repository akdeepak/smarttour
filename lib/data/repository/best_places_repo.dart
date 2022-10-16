import 'package:get/get.dart';

import '../api/api_client.dart';
//Load data from internet using the GetxService
class BestPlacesRepo extends GetxService {
  final ApiClient apiClient;
  BestPlacesRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("end point url");
  }

  Future<List> getBestPlacesList() async{
    return await apiClient.getBestPlacesData();
  }


}