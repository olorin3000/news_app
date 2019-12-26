

import 'package:get_it/get_it.dart';

import 'data/local_data_source.dart';
import 'data/remote_data_source.dart';
import 'data/repository.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory<LocalDataSource>(() => LocalDataSourceImpl());
  sl.registerFactory<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerSingleton<Repository>(RepositoryImpl(
      localDataSource: sl.get<LocalDataSource>(),
      remoteDataSource: sl.get<RemoteDataSource>()
  ));
}