import 'package:manga_app/model/review_model.dart';

class UserProfile {
  final String username;
  final String avatarUrl;
  final String bio;
  final int mangaCount;
  final int mangaReadCount;
  final int level;
  final List<String> showcaseManga; // ショーケースに表示される漫画
  final List<String> recentActivity; // 最近の活動
  final List<Review> reviews; // レビューのリストを追加

  UserProfile({
    required this.username,
    required this.avatarUrl,
    required this.bio,
    required this.mangaCount,
    required this.mangaReadCount,
    required this.level,
    required this.showcaseManga,
    required this.recentActivity,
    required this.reviews, // 新しいフィールド
  });
}
