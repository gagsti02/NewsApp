import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String headerTitle;

  const ListHeader({Key key, this.headerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.0,
        color: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          headerTitle,
          style: const TextStyle(color: Colors.white, fontSize: 35),
        ));
  }
}
