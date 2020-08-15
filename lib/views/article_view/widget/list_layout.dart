import 'package:flutter/material.dart';
import 'package:listitems/viewmodels/categorize/sports_list_model.dart';
import 'package:listitems/viewmodels/categorize/technology_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:listitems/views/article_view/widget/list_feautured.dart';
import 'package:listitems/views/article_view/widget/list_item_tech_news.dart';
import 'package:listitems/views/article_view/widget/list_items_top_news.dart';

import 'list_item_sports_news.dart';

class ListLayout extends StatefulWidget {
  final List<ArticleListModel> articles;
  final List<SportListModel> sportArticles;
  final List<TechnologyListModel> techArticles;

  ListLayout({this.articles, this.sportArticles, this.techArticles});

  @override
  _ListLayoutState createState() => _ListLayoutState();
}

class _ListLayoutState extends State<ListLayout> {
  ArticleViewModel viewModel = ArticleViewModel();
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          title: Text(
            "Feautured news",
            style: TextStyle(shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ], fontSize: 35, color: Colors.white),
          ),
          forceElevated: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: ListFeautured(),
          ),
        ),
        ListItemsTopNews(
          articles: widget.articles,
          headerName: "Top News",
        ),
        ListItemSportNews(
          articles: widget.sportArticles,
          headerName: "Sports",
        ),
        ListItemTechNews(
          articles: widget.techArticles,
          headerName: "Technology",
        )
      ],
    );
  }
}
