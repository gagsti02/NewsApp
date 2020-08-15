import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:listitems/viewmodels/categorize/sports_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

import 'list_header.dart';
import 'list_reordable_list.dart';

class ListItemSportNews extends StatefulWidget {
  final List<SportListModel> articles;

  final String headerName;

  const ListItemSportNews({
    Key key,
    this.articles,
    this.headerName,
  }) : super(key: key);

  @override
  _ListItemSportNewsState createState() => _ListItemSportNewsState();
}

class _ListItemSportNewsState extends State<ListItemSportNews> {
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
              sportarti: article,
            );
          },
          childCount: this.widget.articles.length,
        ),
        onReorder: Provider.of<ArticleViewModel>(context).onReorderSports,
      ),
    );
  }
}
