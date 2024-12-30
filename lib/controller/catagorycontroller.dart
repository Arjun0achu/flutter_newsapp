import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_newsapp/model/searchNews.dart';

import 'package:http/http.dart' as http;

class CategoryController with ChangeNotifier {
  int? selectedCategory = 0;
  List<String> categories = ["All", "sports", "health", "science", "technology",];
  List<Article> newsTopics = [];

  Future<void> getCategories({String? category}) async {
    String? categorydata = category ?? 'general'; 
    
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?category=$categorydata&apiKey=90d22930750445fd821cef472d409c0a",
    );

    try {
      log('Calling getCategories for category: $categorydata');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final articles = SearchNews.fromJson(data).articles ?? [];
        newsTopics = articles;
        log('Fetched articles for category $categorydata: ${articles.length}');
      } else {
        log('Failed to fetch news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Exception occurred while fetching categories: $e');
    }
    notifyListeners();
  }

  
  

  void categorySelection({required int clickedIndex}) {
    selectedCategory = clickedIndex;
    getCategories(category: selectedCategory == 0 ? null : categories[selectedCategory!]);
    notifyListeners();
  }
}
