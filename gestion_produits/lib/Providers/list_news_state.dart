import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ListNewsState extends ChangeNotifier {
  var news = null;
  TextEditingController textEditingController = TextEditingController();

  void searchNews(userKey) {
    String url =
        "https://newsapi.org/v2/everything?q=$userKey&apiKey=2ec554d6e18b467cbf3fcad9c9c0533e";
    http.get(Uri.parse(url)).then((response) {
        news = json.decode(response.body);
        print(news);
        notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }

}