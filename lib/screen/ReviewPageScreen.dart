import 'package:flutter/material.dart';
import '../model/review_model.dart';
import 'ReviewDetailPage.dart';

class ReviewPage extends StatelessWidget {
  final List<Review> reviews;

  ReviewPage(this.reviews);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reviews'),
        backgroundColor: Color(0xFF171A21),
      ),
      backgroundColor: Color(0xFF1B2838),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];

          return GestureDetector(
            onTap: () {
              // タップしたレビューの詳細ページに遷移
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewDetailPage(review: review),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 65,
                    height: 80,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        review.manga[0], // 作品名の最初の文字を表示
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(review.manga,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        SizedBox(height: 5),
                        Text('Score: ${review.score}/100',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70)),
                        SizedBox(height: 5),
                        Text(review.comment,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
