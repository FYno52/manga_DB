import 'package:flutter/material.dart';

import '../model/model.dart';

class MangaDetailScreen extends StatefulWidget {
  final Manga manga;

  MangaDetailScreen({required this.manga, required String mangaTitle});

  @override
  _MangaDetailScreenState createState() => _MangaDetailScreenState();
}

class _MangaDetailScreenState extends State<MangaDetailScreen> {
  final TextEditingController _reviewController = TextEditingController();

  void _addReview() {
    setState(() {
      widget.manga.reviews.add(_reviewController.text);
      _reviewController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.manga.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.manga.description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Reviews', style: TextStyle(fontSize: 20)),
            Expanded(
              child: ListView.builder(
                itemCount: widget.manga.reviews.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.manga.reviews[index]),
                  );
                },
              ),
            ),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(labelText: 'Write a review'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addReview,
              child: Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }
}
