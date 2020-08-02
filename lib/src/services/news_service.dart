import 'package:flutter/material.dart';
import 'package:news_app/src/models/categories_models.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URLNEWS = 'https://newsapi.org/v2';
final _APIKEY = '7313a10c4f674a7f97a7d7454ffba70e';

class NewsServiceProvider with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'general';
  Map<String, List<Article>> categoryArticles = {};
  int _currentindex;

  List<Category> categories = [
    Category('general'),
    Category('business'),
    Category('entertainment'),
    Category('health'),
    Category('science'),
    Category('sports'),
    Category('technology'),
  ];

  NewsServiceProvider() {
    // this.getTopHeadLines();
    _currentindex = 0;
    categories.forEach((value) {
      categoryArticles[value.name] = new List();
    });
  }

  get getSelectedCategory => this._selectedCategory;
  set setSelectedCategory(String value) {
    this._selectedCategory = value;
    getArticlesbyCategoy(value);
    notifyListeners();
  }

  getArticleByCategory() {
    if (categoryArticles['general'].length == 0) {
      getArticlesbyCategoy(this._selectedCategory);
    }
    return categoryArticles[this._selectedCategory];
  }

  getTopHeadLines() async {
    if (headlines.length > 0) {
      return headlines;
    }
    final url = '$_URLNEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(url);
    final newsService = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsService.articles);
    notifyListeners();
  }

  getArticlesbyCategoy(String category) async {
    if (categoryArticles[category].length > 0) {
      return categoryArticles[category];
    }
    final url =
        '$_URLNEWS/top-headlines?apiKey=$_APIKEY&country=us&category=$category';
    final resp = await http.get(url);
    final newsService = newsResponseFromJson(resp.body);
    this.categoryArticles[category].addAll(newsService.articles);
    notifyListeners();
  }

  set setCurrentIndex(int index) {
    _currentindex = index;
    notifyListeners();
  }

  get getCurrentIndex => _currentindex;
}
