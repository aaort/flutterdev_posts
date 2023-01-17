class Post {
  final String title;
  final String author;
  final String? thumbnail;
  final String selftext;
  final String subreddit;
  final int ups;

  const Post({
    required this.title,
    required this.author,
    this.thumbnail,
    required this.selftext,
    required this.subreddit,
    required this.ups,
  });

  factory Post.fromMap(Map<dynamic, dynamic> postMap) {
    return Post(
      title: postMap['title'],
      author: postMap['author'],
      thumbnail: postMap['thumbnail'],
      selftext: postMap['selftext'],
      subreddit: postMap['subreddit'],
      ups: postMap['ups'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'thumbnail': thumbnail,
      'selftext': selftext,
      'subreddit': subreddit,
      'ups': ups,
    };
  }
}
