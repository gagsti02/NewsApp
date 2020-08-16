import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:provider/provider.dart';

class DetailRelated extends StatelessWidget {
  final String article;

  const DetailRelated({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listviewmodel = Provider.of<ArticleViewModel>(context);

    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: listviewmodel.sportsArticle.length,
      itemBuilder: (BuildContext context, int index) {
        var arti = listviewmodel.sportsArticle[index];
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Stack(children: [
            CachedNetworkImage(
              imageUrl: arti.imageUrl,
              imageBuilder: (context, imageprovider) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageprovider, fit: BoxFit.cover)),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  arti.title,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          color: Color.fromARGB(125, 0, 0, 255),
                        )
                      ]),
                ),
              ),
            ),
          ]),
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1),
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
    );
  }
}
