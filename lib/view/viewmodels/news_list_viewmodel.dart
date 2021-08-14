import 'package:flutter/material.dart';
import 'package:practice_app/data/category_info.dart';
import 'package:practice_app/data/search_type.dart';
import 'package:practice_app/models/model/news_model.dart';
import 'package:practice_app/repository/news_repository.dart';

class NewsListViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> getNews(
      {required SearchType searchType,
      String? keyword,
      Category? category}) async {
    _searchType = searchType;
    _keyword = keyword ?? "";
    _category = category ?? categories[0];

    _isLoading = true;
    notifyListeners();

    _articles = await _repository.getNews(
      searchType: _searchType,
      keyword: _keyword,
      category: _category,
    );

    _isLoading = false;
    notifyListeners();
  }
}
