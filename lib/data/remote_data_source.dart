
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/data_wrapper.dart';

abstract class RemoteDataSource{

  Future<DataWrapper> getServerNews();
}

class RemoteDataSourceImpl implements RemoteDataSource{

  final String _url = 'https://newsapi.org/v2/everything?q='
      'bitcoin&'
      'sortBy=publishedAt&'
      'pageSize=100&'
      'apiKey=5f6f780725594729b42938a0c92c955b';

  @override
  Future<DataWrapper> getServerNews() async{


    final response = await http.Client().get(
        Uri.encodeFull(_url),
        headers: {'Accept': 'application/json'}
        );

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return DataWrapper.fromJson(json.decode(response.body));
      //_articles.addAll(Wrapper.fromJson(json.decode(response.body)).articles);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

  }

}