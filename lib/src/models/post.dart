class Post {
  final String title;
  final String author;
  final String? thumbnail;
  final String selftext;
  final String subreddit;
  final int ups;
  final String permalink;

  const Post({
    required this.title,
    required this.author,
    this.thumbnail,
    required this.selftext,
    required this.subreddit,
    required this.ups,
    required this.permalink,
  });

  factory Post.fromMap(Map<dynamic, dynamic> postMap) {
    return Post(
      title: postMap['title'],
      author: postMap['author'],
      thumbnail: postMap['thumbnail'],
      selftext: postMap['selftext'],
      subreddit: postMap['subreddit'],
      ups: postMap['ups'],
      permalink: postMap['permalink'],
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
      'permalink': permalink,
    };
  }
}
