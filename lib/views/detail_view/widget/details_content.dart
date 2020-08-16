import 'package:flutter/material.dart';

class DetailsContent extends StatelessWidget {
  final String description;

  const DetailsContent({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(description ?? "",
          style: TextStyle(
            fontSize: 40,
          )),
    );
  }
}
