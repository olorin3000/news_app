import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/data/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{

  final Repository _repository;

  NewsBloc(this._repository);

  @override
  NewsState get initialState => NewsLoading();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async*{
    final currentState = state;
    if(event is FetchNews){
      try{
        if(currentState is NewsLoading){
          final news = await _repository.getNews();
          yield NewsLoaded(news);
        }
      }catch(_){
        yield NewsError();
      }
    }
  }

}