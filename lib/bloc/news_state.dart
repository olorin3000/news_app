import 'package:equatable/equatable.dart';
import 'package:news_app/data/article.dart';

abstract class NewsState extends Equatable{

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState{}

class NewsError extends NewsState{}

class NewsLoaded extends NewsState{

  final List<Article> newsList;

  NewsLoaded(this.newsList);

  @override
  List<Object> get props => [newsList];


}