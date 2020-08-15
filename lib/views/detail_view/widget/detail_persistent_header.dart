import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:listitems/views/detail_view/widget/detail_persistent_header_content.dart';
import 'package:listitems/views/detail_view/widget/detail_persistent_header_image.dart';

class DetailPersistentHeader implements SliverPersistentHeaderDelegate {
  final String author;
  final String date;
  final String imageUrl;
  final String title;
  final String description;
  final double minExtent;
  final double maxExtent;

  DetailPersistentHeader(
    this.author,
    this.date,
    this.imageUrl,
    this.title,
    this.description,
    this.minExtent,
    this.maxExtent,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
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

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
