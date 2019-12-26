
import 'package:flutter/foundation.dart';
import 'package:news_app/data/article.dart';
import 'package:news_app/data/local_data_source.dart';
import 'package:news_app/data/remote_data_source.dart';

abstract class Repository{

  Future<List<Article>> getNews();
}

class RepositoryImpl implements Repository{

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource
  });

  @override
  Future<List<Article>> getNews() async{
    final remoteData = await remoteDataSource.getServerNews();
    return remoteData.articles;
  }


}