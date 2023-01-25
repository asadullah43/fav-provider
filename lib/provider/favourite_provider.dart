import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _addFav = [];
  List<int> get addFav => _addFav;
  void addItem(int value) {
    _addFav.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _addFav.remove(value);
    notifyListeners();
  }
}
