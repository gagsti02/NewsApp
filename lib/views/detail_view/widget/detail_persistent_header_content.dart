import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailPersistentHeaderContent extends StatelessWidget {
  final String date;
  final String author;
  final String title;

  const DetailPersistentHeaderContent(
      {Key key, this.date, this.author, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(color: Colors.white, fontSize: 14, shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(125, 0, 0, 255),
              )
            ]),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 300,
            height: 100,
            child: AutoSizeText(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              minFontSize: 18,
              maxFontSize: 35,
              style: TextStyle(color: Colors.white, fontSize: 25, shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.0,
                  color: Color.fromARGB(125, 0, 0, 255),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage("assets/images/avatar.jpg")))),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author ?? "N/A",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 1.0,
                            color: Color.fromARGB(125, 0, 0, 255),
                          )
                        ]),
                  ),
                  Text(
                    "Author",
                    style:
                        TextStyle(fontSize: 10, color: Colors.white, shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                      )
                    ]),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
