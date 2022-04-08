import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_produits/Pages/news.dart';
import 'package:http/http.dart' as http;

class NewsDetail extends StatefulWidget {

  var newsDetailed = null;
  String urlToImage ="";
  String description = "";
  String content = "";
  String author = "";
  NewsDetail(this.newsDetailed, {Key? key}) : super(key: key) {
    urlToImage = newsDetailed["urlToImage"];
    description = newsDetailed["description"];
    content = newsDetailed["content"];
    author = newsDetailed["author"];
  }


  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
                Image.network(widget.urlToImage),
                SizedBox(height: 20,),
                Text(widget.description + " \n\n" + widget.content + "\n\nAuthor : " + widget.author)
            ],
          ),
        ),
      )
    );
  }
}
