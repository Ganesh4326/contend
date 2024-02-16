class ChallengeComment {
  final String username;
  final String comment;

  ChallengeComment({required this.username, required this.comment});

  factory ChallengeComment.fromMap(Map<String, dynamic> map) {
    return ChallengeComment(
      username: map['username'] ?? '',
      comment: map['comment'] ?? '',
    );
  }
}
