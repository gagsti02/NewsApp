class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageurl;
  final String publishedAt;
  final String content;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.imageurl,
      this.publishedAt,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json['title'],
        author: json['author'],
        description: json['description'],
        url: json['url'],
        imageurl: json['urlToImage'] != null
            ? json['urlToImage']
            : "https://blog.resellerclub.com/wp-content/uploads/2016/11/icon-joel-8.png",
        publishedAt: json['publishedAt'],
        content: json['content']);
  }
}
