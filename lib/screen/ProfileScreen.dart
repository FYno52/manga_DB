import 'package:flutter/material.dart';
import 'package:manga_app/model/user_model.dart';
import 'package:manga_app/screen/MangaDetailPage.dart';
import 'package:manga_app/screen/ReviewDetailPage.dart';
import 'package:manga_app/screen/ReviewPageScreen.dart';
import 'package:manga_app/screen/SearchPage.dart';

import '../model/review_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isBioExpanded = false;

  final UserProfile user = UserProfile(
    username: 'JohnDoe',
    avatarUrl: 'https://i.imgur.com/SmfwmMT.png',
    bio:
        'Manga enthusiast. Love reading Shonen and Seinen manga. I also enjoy discussing plot twists and character development in the latest manga releases. Always up for recommendations!',
    mangaCount: 50,
    mangaReadCount: 120,
    level: 10,
    showcaseManga: ['Manga 1', 'Manga 2', 'Manga 3'],
    recentActivity: [
      'Reading "Manga 4"',
      'Completed "Manga 5"',
      'Started "Manga 6"'
    ],
    reviews: [
      Review(
          manga: 'Manga 1',
          score: 80,
          comment: 'Great storyline with amazing characters.'),
      Review(
          manga: 'Manga 2',
          score: 90,
          comment: 'Loved the art style, and the story is engaging.'),
      Review(
          manga: 'Manga 3',
          score: 70,
          comment: 'Good but felt like it dragged on a bit.'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B2838), // シックな背景色（暗めの青系）
      appBar: AppBar(
        backgroundColor: Color(0xFF171A21), // シックなAppBar色（さらに暗めの灰色）
        title: Text('${user.username}\'s Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 検索ページに遷移
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(), // SearchPage への画面遷移
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(user),
              SizedBox(height: 20),
              _buildLevelSection(user),
              SizedBox(height: 20),
              _buildShowcaseSection(user),
              SizedBox(height: 20),
              _buildActivitySection(user),
              SizedBox(height: 20),
              _buildReviewSection(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserProfile user) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.username,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                user.bio,
                style: TextStyle(fontSize: 16, color: Colors.white70),
                maxLines: _isBioExpanded ? null : 2, // 展開時は無制限、非展開時は2行
                overflow: _isBioExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isBioExpanded = !_isBioExpanded; // 押すたびに展開/縮小を切り替え
                  });
                },
                child: Text(
                  _isBioExpanded
                      ? "Show less"
                      : "Show more", // 展開時は「Show less」を表示
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLevelSection(UserProfile user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text('Level ${user.level}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Manga Count: ${user.mangaCount}',
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
              Text('Manga Read: ${user.mangaReadCount}',
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShowcaseSection(UserProfile user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Showcase Manga',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        SizedBox(height: 10),
        Container(
          height: 120, // ショーケースアイテムの高さ
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // 横方向のスクロールを有効に
            itemCount: user.showcaseManga.length,
            itemBuilder: (context, index) {
              final manga = user.showcaseManga[index];
              return GestureDetector(
                onTap: () {
                  // タップ時に詳細ページに遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MangaDetailPage(mangaTitle: manga),
                    ),
                  );
                },
                child: Container(
                  width: 100, // 各ショーケースアイテムの幅
                  margin: EdgeInsets.only(right: 10), // アイテム間の間隔
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(manga, style: TextStyle(color: Colors.white)),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActivitySection(UserProfile user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Activity',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: user.recentActivity.length,
          itemBuilder: (context, index) {
            final activity = user.recentActivity[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity, style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                // ショーケース部分の横スクロール
                Container(
                  height: 100, // ショーケースの高さ
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // 横方向のスクロールを有効に
                    itemCount: 5, // 適切な数のショーケースを表示
                    itemBuilder: (context, showcaseIndex) {
                      final mangaTitle = 'Manga ${showcaseIndex + 1}';
                      return GestureDetector(
                        onTap: () {
                          // タップ時に詳細ページに遷移
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MangaDetailPage(mangaTitle: mangaTitle),
                            ),
                          );
                        },
                        child: Container(
                          width: 80, // 各ショーケースアイテムの幅を設定
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(mangaTitle,
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildSmallShowcase() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            margin: EdgeInsets.only(right: 10),
            color: Colors.grey[700], // ショーケースも暗め
            child: Center(
              child: Text('Manga ${index + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildReviewSection(UserProfile user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Reviews',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: user.reviews.length > 3 ? 3 : user.reviews.length,
          itemBuilder: (context, index) {
            final review = user.reviews[index];
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
                margin: EdgeInsets.symmetric(vertical: 8),
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
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70)),
                          SizedBox(height: 5),
                          Text(review.comment,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReviewPage(user.reviews)),
            );
          },
          child: Text(
            'See all reviews',
            style: TextStyle(color: Colors.blueAccent, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
