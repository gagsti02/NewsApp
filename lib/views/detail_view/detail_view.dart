import 'package:flutter/material.dart';
import 'package:listitems/viewmodels/categorize/sports_list_model.dart';
import 'package:listitems/viewmodels/categorize/technology_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_list_model.dart';
import 'package:listitems/views/detail_view/widget/detail_persistent_header.dart';

class DetailView extends StatefulWidget {
  final ArticleListModel article;
  final SportListModel sportarti;
  final TechnologyListModel techarti;

  const DetailView({Key key, this.article, this.sportarti, this.techarti})
      : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> with TickerProviderStateMixin {
  TabController tabContoller;
  @override
  void initState() {
    super.initState();
    tabContoller = new TabController(
      vsync: this,
      length: 3,
    );
  }

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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 50.0,
          ),
          SliverPersistentHeader(
              pinned: false,
              delegate: DetailPersistentHeader(arti.author, arti.publishedAt,
                  arti.imageUrl, arti.title, arti.description, 300, 350)),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  arti.description ?? "",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
