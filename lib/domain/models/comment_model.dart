class Comment {
  final int id;
  final String authorName;
  final String commentText;
  final DateTime time;

  const Comment({
    required this.id,
    required this.authorName,
    required this.commentText,
    required this.time,
  });
}

class Answer extends Comment {
  final String initialCommentAuthorName;

  const Answer({
    required super.id,
    required super.authorName,
    required super.commentText,
    required super.time,
    required this.initialCommentAuthorName,
  });
}
