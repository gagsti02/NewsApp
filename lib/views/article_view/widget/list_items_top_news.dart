import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:listitems/viewmodels/headlines/article_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:reorderables/reorderables.dart';
import 'package:provider/provider.dart';

import 'list_header.dart';
import 'list_reordable_list.dart';

class ListItemsTopNews extends StatefulWidget {
  final List<ArticleListModel> articles;

  final String headerName;

  const ListItemsTopNews({
    Key key,
    this.articles,
    this.headerName,
  }) : super(key: key);

  @override
  _ListItemsTopNewsState createState() => _ListItemsTopNewsState();
}

class _ListItemsTopNewsState extends State<ListItemsTopNews> {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: ListHeader(
        headerTitle: this.widget.headerName,
      ),
      sliver: ReorderableSliverList(
        delegate: ReorderableSliverChildBuilderDelegate(
          (context, index) {
            var article = this.widget.articles[index];
            return ListReordableList(
              article: article,
            );
          },
          childCount: this.widget.articles.length,
        ),
        onReorder: Provider.of<ArticleViewModel>(context).onReorder,
      ),
    );
  }
}
