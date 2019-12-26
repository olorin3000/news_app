class Article{

  final String author;
  final String title;
  final String description;
  final String urlToImage;

  Article({this.author, this.title, this.description, this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage']
    );
  }
}