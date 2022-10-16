import 'package:get/get.dart';
import '../data/repository/best_places_repo.dart';
import '../data/repository/nearby_places_repo.dart';
import '../models/products_model.dart';

class BestPlacesController extends GetxController{
  final BestPlacesRepo bestPlacesRepo;
  BestPlacesController({required this.bestPlacesRepo});

  List<dynamic> _bestPlacesList = [];
  List<dynamic> get bestPlacesList => _bestPlacesList;

  Future<void> getBestPlacesList() async{
    List<dynamic> result = await bestPlacesRepo.getBestPlacesList();
    _bestPlacesList = [];
    _bestPlacesList.addAll(result);
     update(); // set state
  }
}