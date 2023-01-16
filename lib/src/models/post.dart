class Post {
  final String title;
  final String author;
  final String? thumbnail;
  final String selftext;
  final int ups;

  const Post({
    required this.title,
    required this.author,
    this.thumbnail,
    required this.selftext,
    required this.ups,
  });

  factory Post.fromMap(Map<String, dynamic> postMap) {
    return Post(
      title: postMap['title'],
      author: postMap['author'],
      thumbnail: postMap['thumbnail'],
      selftext: postMap['selftext'],
      ups: postMap['ups'],
    );
  }
}
