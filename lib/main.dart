import 'package:flutter/material.dart';
import 'package:practice_app/view/screens/home_screen.dart';
import 'package:practice_app/view/style/style.dart';
import 'package:practice_app/view/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<NewsListViewModel>(
    create: (context) => NewsListViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(brightness: Brightness.dark, fontFamily: BoldFont),
      home: HomeScreen(),
    );
  }
}
