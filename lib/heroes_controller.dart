import 'package:flutter/cupertino.dart';
import 'package:herois_favoritos/hero_model.dart';

class HeroesController  extends ChangeNotifier {

  List<HeroModel> heroes = [
    HeroModel(name: "Thor"),
    HeroModel(name: "Iron Man"),
    HeroModel(name: "Batman"),
    HeroModel(name: "Captain America"),
    HeroModel(name: "Superman"),
  ];

  checkFavorites(HeroModel model) {
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }

}