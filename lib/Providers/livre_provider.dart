import 'package:flutter/material.dart';
import 'package:flutter_app/API/ApiService.dart';
import 'package:flutter_app/Entities/livre.dart';


class Livre_Provider with ChangeNotifier {
  List<Book> _books = [];
  bool _isLoading = false;

  List<Book> get books => _books;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();




  // Méthode pour ajouter un nouveau livre
  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  Future<void> searchBooks(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _books = await _apiService.fetchBooks(query);
    } catch (error) {
      _books = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
