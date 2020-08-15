import 'package:flutter/material.dart';
import 'package:listitems/model/article.dart';
import 'package:listitems/services/web_services.dart';
import 'package:listitems/viewmodels/categorize/sports_list_model.dart';
import 'package:listitems/viewmodels/categorize/technology_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_list_model.dart';

enum LoadingStatus { completed, searching, empty }

class ArticleViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<ArticleListModel> articles = List<ArticleListModel>();

  List<SportListModel> sportsArticle = List<SportListModel>();
  List<TechnologyListModel> technologyArticle = List<TechnologyListModel>();

  List<ArticleListModel> get news => articles;

  void onReorder(int oldIndex, int newIndex) {
    ArticleListModel row = articles.removeAt(oldIndex);
    articles.insert(newIndex, row);
    notifyListeners();
  }

  void onReorderSports(int oldIndex, int newIndex) {
    SportListModel row = sportsArticle.removeAt(oldIndex);
    sportsArticle.insert(newIndex, row);
    notifyListeners();
  }

  void onReorderTech(int oldIndex, int newIndex) {
    TechnologyListModel row = technologyArticle.removeAt(oldIndex);
    technologyArticle.insert(newIndex, row);
    notifyListeners();
  }

  void addArticle(ArticleListModel article) {
    articles.add(article);
    print(articles);

    notifyListeners();
  }

  void headlines() async {
    List<Article> newsArticle = await WebService().fetchHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    articles = newsArticle.map((e) => ArticleListModel(article: e)).toList();
    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void sportHeadlines() async {
    List<Article> newsArticle =
        await WebService().fetchCategoriesHeadline("sports");
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    sportsArticle = newsArticle.map((e) => SportListModel(article: e)).toList();
    if (sportsArticle.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void technologyHeadline() async {
    List<Article> newsArticle =
        await WebService().fetchCategoriesHeadline("technology");
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    technologyArticle =
        newsArticle.map((e) => TechnologyListModel(article: e)).toList();
    if (technologyArticle.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
