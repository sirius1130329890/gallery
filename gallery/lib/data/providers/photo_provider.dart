import 'dart:convert';

import 'package:http/http.dart';

import '../models/photo.dart';

class DataProvider {
  final String _baseUrl = 'https://api.unsplash.com/photos';
  final String _apiKey = 'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  Future<PhotoList> fetchPhotos() async {
    final response = await get(Uri.parse('$_baseUrl/?client_id=$_apiKey'));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return PhotoList.fromJson(json);
    } else {
      throw Exception('Failed to load photos');
    }
  }
}