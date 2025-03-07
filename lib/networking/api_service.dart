import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String api_url = "https://yummie.glitch.me/dish-categories";

  Future<Map<String, dynamic>> fetchData() async {
    try{
      Response response = await _dio.get(api_url);
      if(response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
        throw Exception("Error $e");
    }

  }


}