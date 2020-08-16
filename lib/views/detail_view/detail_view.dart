import 'package:flutter/material.dart';
import 'package:listitems/viewmodels/categorize/sports_list_model.dart';
import 'package:listitems/viewmodels/categorize/technology_list_model.dart';
import 'package:listitems/viewmodels/headlines/article_list_model.dart';
import 'package:listitems/views/detail_view/widget/detail_related.dart';
import 'package:listitems/views/detail_view/widget/detail_persistent_header.dart';

import 'widget/detail_others.dart';
import 'widget/details_content.dart';

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
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
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
    List<Widget> tabs = [
      DetailsContent(
        description: arti.description,
      ),
      DetailRelated(),
      DetailOthers(),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverPersistentHeader(
                  pinned: false,
                  delegate: DetailPersistentHeader(
                      arti.author,
                      arti.publishedAt,
                      arti.imageUrl,
                      arti.title,
                      arti.description,
                      300,
                      350)),
            ),
          ];
        },
        body: Container(
          child: Column(
            children: [
              TabBar(
                controller: controller,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "News Content "),
                  Tab(text: "Related"),
                  Tab(text: "Other's"),
                ],
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: controller,
                    children: tabs.map((tab) => tab).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

//OLD RETURN
    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         pinned: true,
    //         expandedHeight: 50.0,
    //       ),
    //       SliverPersistentHeader(
    //           pinned: false,
    //           delegate: DetailPersistentHeader(arti.author, arti.publishedAt,
    //               arti.imageUrl, arti.title, arti.description, 300, 350)),
    //       SliverList(
    //         delegate: SliverChildListDelegate([
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    // child: Text(
    //   arti.description ?? "",
    //   style: TextStyle(
    //     fontSize: 35,
    //               ),
    //             ),
    //           )
    //         ]),
    //       ),
    //     ],
    //   ),
    // );
  }
}
