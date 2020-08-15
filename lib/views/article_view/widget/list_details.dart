import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ListDetails extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const ListDetails({Key key, this.title, this.description, this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          this.title == null ? "" : this.title,
          overflow: TextOverflow.clip,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        AutoSizeText(
          this.description == null ? "" : this.description,
          maxLines: 4,
          overflow: TextOverflow.visible,
        ),
        SizedBox(
          height: 10,
        ),
        AutoSizeText(
          this.date == null ? "" : this.date,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
