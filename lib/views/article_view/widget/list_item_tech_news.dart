import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:listitems/viewmodels/categorize/technology_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

import 'list_header.dart';
import 'list_reordable_list.dart';

class ListItemTechNews extends StatefulWidget {
  final List<TechnologyListModel> articles;

  final String headerName;

  const ListItemTechNews({
    Key key,
    this.articles,
    this.headerName,
  }) : super(key: key);

  @override
  _ListItemTechNewsState createState() => _ListItemTechNewsState();
}

class _ListItemTechNewsState extends State<ListItemTechNews> {
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
              techarti: article,
            );
          },
          childCount: this.widget.articles.length,
        ),
        onReorder: Provider.of<ArticleViewModel>(context).onReorderTech,
      ),
    );
  }
}
