import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/data/repository.dart';
import 'injection_container.dart' as di;

void main() async{
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: BlocProvider(
          create: (context) => NewsBloc(di.sl.get<Repository>())..add(FetchNews()),
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = BlocProvider.of<NewsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      // ignore: missing_return
      builder: (context, state){

        if(state is NewsLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if(state is NewsError){
          return Center(
            child: Text('failed to fetch posts'),
          );
        }

        if(state is NewsLoaded){
          if(state.newsList.isEmpty){
            return Center(
              child: Text('no news'),
            );
          }

          return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.newsList[index].title),
                subtitle: Text(state.newsList[index].description),
              );
            },
          );
        }
      },
    );
  }

}


