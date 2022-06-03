import 'package:f3_lugares/data/my_data.dart';
import 'package:f3_lugares/models/place.dart';
import 'package:flutter/cupertino.dart';

class PlaceList with ChangeNotifier {
  final List<Place> _place = DUMMY_PLACES;

  List<Place> get places {
    return [..._place];
  }

  List<Place> get favoritePlaces {
    return _place.where((element) => element.favorito).toList();
  }
}
