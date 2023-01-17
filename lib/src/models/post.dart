class Post {
  final String title;
  final String author;
  final String? thumbnail;
  final int? thumbnailHeight;
  final int? thumbnailWidth;
  final String selftext;
  final String subreddit;
  final int ups;

  const Post({
    required this.title,
    required this.author,
    this.thumbnail,
    this.thumbnailHeight,
    this.thumbnailWidth,
    required this.selftext,
    required this.subreddit,
    required this.ups,
  });

  factory Post.fromMap(Map<dynamic, dynamic> postMap) {
    return Post(
      title: postMap['title'],
      author: postMap['author'],
      thumbnail: postMap['thumbnail'],
      thumbnailHeight: postMap['thumbnail_height'],
      thumbnailWidth: postMap['thumbnail_width'],
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
      'thumbnailHeight': thumbnailHeight,
      'thumbnailWidth': thumbnailWidth,
      'selftext': selftext,
      'subreddit': subreddit,
      'ups': ups,
    };
  }
}
