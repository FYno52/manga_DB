class Review {
  final String manga;
  final int score; // 100点満点のスコア
  final String comment;

  Review({
    required this.manga,
    required this.score,
    required this.comment,
  }) : assert(score >= 0 && score <= 100, 'Score must be between 0 and 100');
}
