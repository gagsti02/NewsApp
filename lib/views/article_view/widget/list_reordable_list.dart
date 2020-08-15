import 'package:flutter/material.dart';
import 'package:listitems/viewmodels/categorize/sports_list_model.dart';
import 'package:listitems/viewmodels/categorize/technology_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_list_model.dart';
import 'package:listitems/views/detail_view/detail_view.dart';

import 'list_details.dart';
import 'list_image.dart';

class ListReordableList extends StatefulWidget {
  final ArticleListModel article;
  final SportListModel sportarti;
  final TechnologyListModel techarti;

  const ListReordableList(
      {Key key, this.article, this.sportarti, this.techarti})
      : super(key: key);

  @override
  _ListReordableListState createState() => _ListReordableListState();
}

class _ListReordableListState extends State<ListReordableList> {
  @override
  Widget build(BuildContext context) {
    var arti;
    if (this.widget.article != null) {
      arti = this.widget.article;
    } else if (this.widget.sportarti != null) {
      arti = this.widget.sportarti;
    } else {
      arti = this.widget.techarti;
    }
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => _showDetailSection(context, this.widget.article),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: ListDetails(
                  title: arti.title,
                  description: arti.description,
                  date: arti.publishedAt,
                )),
                ListImage(
                  imageUrl: arti.imageUrl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDetailSection(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailView(
        article: widget.article,
        sportarti: widget.sportarti,
        techarti: widget.techarti,
      );
    }));
  }
}
