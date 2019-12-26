import 'article.dart';

class DataWrapper{

  final String status;
  final List<Article> articles;

  DataWrapper({this.status, this.articles});

  factory DataWrapper.fromJson(Map<String, dynamic> json){

    /*var streetsFromJson = json['articles'];
    List<Article> streetsList = new List<Article>.from(streetsFromJson);*/

    var list = json['articles'] as List;
    List<Article> articleList = list.map((i) => Article.fromJson(i)).toList();

    return DataWrapper(
      status : json['status'],
      articles : articleList
    );
  }
}