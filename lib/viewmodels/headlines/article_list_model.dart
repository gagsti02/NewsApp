import 'package:intl/intl.dart';
import 'package:listitems/model/article.dart';

class ArticleListModel {
  Article _article;

  ArticleListModel({Article article}) : _article = article;

  String get title {
    return _article.title;
  }

  String get description {
    return _article.description;
  }

  String get imageUrl {
    return _article.imageurl;
  }

  String get author {
    return _article.author;
  }

  String get publishedAt {
    final datetime =
        DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(_article.publishedAt, true);
    return DateFormat.yMMMMEEEEd("en-us").format(datetime).toString();
  }

  String get content {
    return _article.content;
  }
}
