// import 'package:galleryapp/model/items.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemProvider with ChangeNotifier {
  Color _favColor;
  List<String> items;

  ItemProvider() {
    _favColor = Colors.grey;
    items = [];
  }

  // Getters
  Color get favcolor => _favColor;
  List<String> get myFavourates => items;

  // Setters
  void setFavcolor(Color favcolor) {
    _favColor = favcolor;
    notifyListeners();
  }

  void setFavourates(List<String> favourates) {
    items = favourates;
    notifyListeners();
  }

  void addFavItems(String myFav) {
    if (items.contains(myFav) == false) {
      items.add(myFav);
      notifyListeners();
    } else {
      items.remove(myFav);
      notifyListeners();
    }
  }

  savePreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString('key', _favcolor)
  }
}
