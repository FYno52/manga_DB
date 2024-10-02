import 'package:flutter/material.dart';
import 'MangaDetailPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchResults = []; // 検索結果のリスト

  void _searchManga(String query) {
    // 検索ロジック (ここではデモとして仮の検索結果を使用)
    setState(() {
      searchResults = [
        'Manga 1',
        'Manga 2',
        'Manga 3',
        'Manga 4',
      ]
          .where((manga) => manga.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF171A21),
        title: Text('Search Manga'),
      ),
      backgroundColor: Color(0xFF1B2838),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for manga...',
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                _searchManga(query);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final mangaTitle = searchResults[index];
                  return ListTile(
                    title: Text(
                      mangaTitle,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // MangaDetailPage に遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MangaDetailPage(
                            mangaTitle: mangaTitle,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
