import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test2/models/products_model.dart';

class ApiClient extends GetConnect implements GetxService {
  late String? token;
  //server url
  final String appBaseUrl;
  late Map<String,String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl
}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds:30);
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      // 'Authorization':'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
// Created by Deepak to read data from Local ..
  Future<List> getNearbyPlacesData() async {
    List<dynamic> _nearbyPlacesList = [];
    final String res = await rootBundle.loadString("data/nearby_places.json");
    var list = await json.decode(res);
    List<ProductModel>? iterList = Product.fromJson(list).products;
    for(ProductModel pm in iterList!){
      _nearbyPlacesList.add(pm);
    }
    return _nearbyPlacesList;
  }

  Future<List> getNyPlacesList() async {
    List<dynamic> _nyPlacesList = [];
    final String res = await rootBundle.loadString("data/newyork_places.json");
    var list = await json.decode(res);
    List<ProductModel>? iterList = Product.fromJson(list).products;
    for(ProductModel pm in iterList!){
      print("New york places List");
      print(pm.id);
      print(pm.name);
      _nyPlacesList.add(pm);
    }
    return _nyPlacesList;
  }

  Future<List> getBestPlacesData() async {
    List<dynamic> _bestPlacesList = [];
    final String res = await rootBundle.loadString("data/best_places.json");
    var list = await json.decode(res);
    List<ProductModel>? iterList = Product.fromJson(list).products;
    for(ProductModel pm in iterList!){
      _bestPlacesList.add(pm);
    }
    return _bestPlacesList;
  }

}