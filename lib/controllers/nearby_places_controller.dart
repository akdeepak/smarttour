import 'package:get/get.dart';
import '../data/repository/nearby_places_repo.dart';
import '../models/products_model.dart';

class NearbyPlacesController extends GetxController{
  final NearbyPlacesRepo popularProductRepo;
  NearbyPlacesController({required this.popularProductRepo});


  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  List<dynamic> _nearbyPlacesList = [];
  List<dynamic> get nearbyPlacesList => _nearbyPlacesList;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo!.getPopularProductList();
    if(response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.add(Product.fromJson(response.body).products);
      update(); //setState
    }else{

    }
  }

  Future<void> getNearbyPlacesList() async{
    List<dynamic> result = await popularProductRepo.getNearbyPlacesList();
    _nearbyPlacesList = [];
    _nearbyPlacesList.addAll(result);
     update(); // set state
  }
}