import 'package:dio/dio.dart';
import 'package:foodie_app/model/cat_items_model.dart';

class CatItemService {
  final Dio _dio = Dio();

  Future<List<CatItem>> fetchCatItems(String itemId) async {
    final String apiUrl = "https://yummie.glitch.me//dishes/$itemId";
    
    try{
      Response response = await _dio.get(apiUrl);
      if(response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((item) => CatItem.fromJson(item)).toList();
      } else{
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception("Error$e");
    }
  }
}