import 'package:get/get.dart';
import '../data/repository/ny_places_repo.dart';
import '../models/products_model.dart';

class NYPlacesController extends GetxController{
  final NYPlacesRepo nyProductRepo;
  NYPlacesController({required this.nyProductRepo});


  List<dynamic> _nyplacesList = [];
  List<dynamic> get nyPlacesList => _nyplacesList;


  // Future<void> getPopularProductList() async{
  //   Response response = await popularProductRepo!.getPopularProductList();
  //   if(response.statusCode == 200) {
  //     _nyplacesList = [];
  //     _nyplacesList.add(Product.fromJson(response.body).products);
  //     update(); //setState
  //   }else{
  //
  //   }
  // }

  Future<void> getNyPlacesList() async{
    List<dynamic> result = await nyProductRepo.getNyPlacesList();
    _nyplacesList = [];
    _nyplacesList.addAll(result);
    update(); // set state
  }
}