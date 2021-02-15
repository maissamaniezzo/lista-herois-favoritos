import 'package:flutter/material.dart';
import 'package:herois_favoritos/hero_model.dart';
import 'package:provider/provider.dart';

import 'heroes_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _buildList() {
    
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {

    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(
      onTap: () {
        heroesController.checkFavorites(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite 
      ? Icon(Icons.star, color: Colors.yellow)
      : Icon(Icons.star_border)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heróis favoritos"),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Center(
              child: Text(
                "${heroesController.heroes.where((i) => i.isFavorite == true).length}",
                style: TextStyle(fontSize: 18),
              ),
            );
          }
        ),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList();
        }
      ),
    );
  }
}
