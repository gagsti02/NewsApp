import 'package:flutter/material.dart';
import 'package:listitems/viewmodels/headlines/article_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:listitems/views/detail_view/detail_view.dart';
import 'package:provider/provider.dart';

class ListFeautured extends StatefulWidget {
  @override
  _ListFeauturedState createState() => _ListFeauturedState();
}

class _ListFeauturedState extends State<ListFeautured> {
  @override
  Widget build(BuildContext context) {
    List<ArticleListModel> listviewmodel =
        context.watch<ArticleViewModel>().articles;
    return GestureDetector(
      onTap: () => _showDetailSection(context, listviewmodel[0]),
      child: Stack(fit: StackFit.expand, children: [
        Image.network(
          listviewmodel[0].imageUrl,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            color: Colors.red,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                listviewmodel[0].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  void _showDetailSection(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailView(article: article);
    }));
  }
}
