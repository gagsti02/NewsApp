import 'package:flutter/material.dart';
import 'package:listitems/viewmodels/headlines/article_view_model.dart';
import 'package:listitems/views/article_view/article_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ArticleViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "News List",
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                color: Colors.blueAccent,
                textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
                iconTheme: IconThemeData(color: Colors.black, size: 35)),
            accentIconTheme: IconThemeData(color: Colors.black)),
        home: ArticleView(),
      ),
    );
  }
}
