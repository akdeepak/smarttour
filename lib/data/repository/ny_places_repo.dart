import 'package:get/get.dart';

import '../api/api_client.dart';
//Load data from internet using the GetxService
class NYPlacesRepo extends GetxService {
  final ApiClient apiClient;
  NYPlacesRepo({required this.apiClient});

   Future<List> getNyPlacesList() async{
    return await apiClient.getNyPlacesList();
  }


}