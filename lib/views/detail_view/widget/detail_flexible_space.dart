import 'package:flutter/material.dart';

import 'detail_persistent_header_content.dart';
import 'detail_persistent_header_image.dart';

class DetailFlexibleSpace extends StatelessWidget {
  final String author;
  final String date;
  final String imageUrl;
  final String title;
  final String description;

  const DetailFlexibleSpace(
      {Key key,
      this.author,
      this.date,
      this.imageUrl,
      this.title,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DetailPersistentHeaderImage(
        imageUrl: imageUrl,
      ),
      DetailPersistentHeaderContent(
        date: date,
        author: author,
        title: title,
      ),
    ]);
  }
}
