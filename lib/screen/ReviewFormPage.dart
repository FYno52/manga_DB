import 'package:flutter/material.dart';
import '../model/review_model.dart';

class ReviewFormPage extends StatefulWidget {
  final Function(Review) onReviewAdded; // Correct type for callback

  ReviewFormPage({required this.onReviewAdded}); // Ensure callback is required

  @override
  _ReviewFormPageState createState() => _ReviewFormPageState();
}

class _ReviewFormPageState extends State<ReviewFormPage> {
  final TextEditingController _commentController = TextEditingController();
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Review'),
        backgroundColor: Color(0xFF171A21),
      ),
      backgroundColor: Color(0xFF1B2838),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Score:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Slider(
              value: _score.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: _score.toString(),
              onChanged: (value) {
                setState(() {
                  _score = value.toInt();
                });
              },
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Comment',
                labelStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Create a new review and pass it back
                final review = Review(
                  manga:
                      'Sample Manga', // Replace with actual manga title if needed
                  score: _score,
                  comment: _commentController.text,
                );
                widget.onReviewAdded(review); // Correct usage of callback
                Navigator.pop(context); // Go back to previous screen
              },
              child: Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }
}
