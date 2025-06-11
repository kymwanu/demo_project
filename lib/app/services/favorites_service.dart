import 'package:demo_project/app/models/item_model.dart';

class FavoriteService {
  static final FavoriteService _instance = FavoriteService._internal();
  final List<Item> _favoriteItems = [];

  factory FavoriteService() {
    return _instance;
  }
  FavoriteService._internal();

  List<Item> get favoriteItems => _favoriteItems;

  void toggleFavorite(Item item) {
    if (_favoriteItems.any((element) => element.id == item.id)) {
      _favoriteItems.removeWhere((element) => element.id == item.id);
    } else {
      _favoriteItems.add(item);
    }
  }

  bool isFavorite(Item item) {
    return _favoriteItems.any((element) => element.id == item.id);
  }
}
