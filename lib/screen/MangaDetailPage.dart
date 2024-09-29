import 'package:flutter/material.dart';

class MangaDetailPage extends StatelessWidget {
  final String mangaTitle;

  MangaDetailPage({required this.mangaTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mangaTitle),
        backgroundColor: Color(0xFF171A21),
      ),
      backgroundColor: Color(0xFF1B2838),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mangaTitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "This is a detailed description of the manga \"$mangaTitle\". You can add more information here like genre, author, summary, etc.",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              "Score: 95/100", // デモ用スコア
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
