import 'package:flutter/material.dart';
import 'package:manga_app/screen/ProfileScreen.dart';

void main() {
  runApp(MyMangaApp());
}

class MyMangaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfileScreen(),
    );
  }
}
