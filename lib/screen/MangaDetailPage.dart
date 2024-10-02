import 'package:flutter/material.dart';
import 'ReviewFormPage.dart';
import '../model/review_model.dart';

class MangaDetailPage extends StatelessWidget {
  final String mangaTitle;

  MangaDetailPage({required this.mangaTitle}); // Define mangaTitle parameter

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
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              "Details about the manga $mangaTitle.",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              "Score: 95/100",
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewFormPage(
                      onReviewAdded: (Review review) {
                        // Handle review addition logic here
                        print(
                            'Review Added: ${review.manga}, Score: ${review.score}, Comment: ${review.comment}');
                      },
                    ),
                  ),
                );
              },
              child: Text('Add a Review'),
            ),
          ],
        ),
      ),
    );
  }
}
