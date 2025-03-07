import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodie_app/model/food_model.dart';
import 'package:foodie_app/networking/api_service.dart';


class FoodProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<CategoryItems> _categories = [];
  List<PopularItem> _popularItems = [];
  List<SpecialItem> _specialItems = [];

  List<CategoryItems> get categories => _categories;
  List<PopularItem> get popularItems => _popularItems;
  List<SpecialItem> get specialItems => _specialItems;

  bool _isLoading = false;
  bool get isLoading  => _isLoading;

  Future<void> fetchFoodData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.fetchData();

      _categories =(data['categories'] as List).map((item) => CategoryItems.fromJson(item)).toList();
      _popularItems =(data['populars'] as List).map((item) => PopularItem.fromJson(item)).toList();
      _specialItems =(data['specials'] as List).map((item) => SpecialItem.fromJson(item)).toList();
    } catch (e) {
      throw Exception("Error $e");
    }

    _isLoading = false;
    notifyListeners();

  }



}