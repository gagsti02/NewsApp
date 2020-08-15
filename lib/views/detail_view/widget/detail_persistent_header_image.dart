import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailPersistentHeaderImage extends StatelessWidget {
  final String imageUrl;

  const DetailPersistentHeaderImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageprovider) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: imageprovider, fit: BoxFit.cover)),
        );
      },
    );
  }
}
