import 'package:dio/dio.dart';
import 'package:listitems/model/article.dart';
import 'package:listitems/util/constant.dart';

class WebService {
  var dio = new Dio();

  Future<List<Article>> fetchHeadlines() async {
    final response = await dio.get(Constant.topHeadlines);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception("Failes to load news");
    }
  }

  Future<List<Article>> fetchCategoriesHeadline(String category) async {
    final response = await dio.get(Constant.topCategories(category));
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception("Failes to load news");
    }
  }
}
