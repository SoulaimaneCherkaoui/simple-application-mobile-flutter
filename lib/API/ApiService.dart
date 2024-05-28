import 'dart:convert';
import 'package:flutter_app/Entities/livre.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes?q=';

  Future<List<Book>> fetchBooks(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + query));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];
      return data.map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
