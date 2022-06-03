import 'package:f3_lugares/models/place_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/place_item.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlaceList>(context);

    final countryPlaces = provider.favoritePlaces;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Favoritos"),
      ),
      body: ListView.builder(
          itemCount: countryPlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(countryPlaces[index]);
          }),
    );
  }
}
