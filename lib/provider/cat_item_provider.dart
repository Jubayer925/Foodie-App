import 'package:flutter/material.dart';
import 'package:foodie_app/model/cat_items_model.dart';
import 'package:foodie_app/networking/cat_items_service.dart';


class CatItemsProvider extends ChangeNotifier{
  final CatItemService _service = CatItemService();
  List<CatItem> _items = [] ;
  bool _isLoading = false;

  List<CatItem> get catItems => _items;
  bool get isLoading => _isLoading;

  Future<void> fetchItems(String itemId) async {
    _isLoading = true;
    notifyListeners();

    try{
      _items = await _service.fetchCatItems(itemId);
    } catch (e) {
      throw Exception("Error");
    }

    _isLoading = false;
    notifyListeners();
  }
}
