import 'package:flutter/material.dart';
import '../model/review_model.dart';
import 'MangaDetailPage.dart';

class ReviewDetailPage extends StatelessWidget {
  final Review review;

  ReviewDetailPage({required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review of ${review.manga}'),
        backgroundColor: Color(0xFF171A21),
      ),
      backgroundColor: Color(0xFF1B2838),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.manga,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Score: ${review.score}/100',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 10),
            Text(
              review.comment,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // MangaDetailPageに遷移する処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MangaDetailPage(mangaTitle: review.manga),
                  ),
                );
              },
              child: Text('View ${review.manga} Details'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // 旧: primary
                foregroundColor: Colors.white, // 旧: onPrimary
              ),
            )
          ],
        ),
      ),
    );
  }
}
