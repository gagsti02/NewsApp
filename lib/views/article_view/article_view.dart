import 'package:flutter/material.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:listitems/views/article_view/widget/list_layout.dart';
import 'package:provider/provider.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key key}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ArticleViewModel>(context, listen: false).headlines();
    Provider.of<ArticleViewModel>(context, listen: false).sportHeadlines();
    Provider.of<ArticleViewModel>(context, listen: false).technologyHeadline();
  }

  @override
  Widget build(BuildContext context) {
    var listviewmodel = Provider.of<ArticleViewModel>(context);
    return Scaffold(
        body: listviewmodel.articles.length > 0
            ? ListLayout(
                articles: listviewmodel.articles,
                sportArticles: listviewmodel.sportsArticle,
                techArticles: listviewmodel.technologyArticle,
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
