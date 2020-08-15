import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListImage extends StatelessWidget {
  final String imageUrl;
  const ListImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageprovider) {
        return Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: imageprovider, fit: BoxFit.cover)),
        );
      },
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) {
        return Container();
      },
    );
  }
}
