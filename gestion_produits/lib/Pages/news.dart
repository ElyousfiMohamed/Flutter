import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_produits/Pages/newsDetail.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var news = null;
  TextEditingController textEditingController = TextEditingController();

  void searchNews(userKey) {
    String url =
        "https://newsapi.org/v2/everything?q=$userKey&apiKey=2ec554d6e18b467cbf3fcad9c9c0533e";
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        news = json.decode(response.body);
        print(news);
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,15),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.green.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.green.shade400)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  )),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searchNews(textEditingController.text);
                      });
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: news == null || news["articles"] == null
                        ? 0
                        : news["articles"].length,
                    itemBuilder: (context, index) {
                      if (news["articles"][index]["urlToImage"] != null &&
                          news["articles"][index]["title"] != null) {
                        return Card(
                          elevation: 1,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: ListTile(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetail(news["articles"][index]),
                                  )
                                );
                              },
                              leading: Image.network(news["articles"][index]["urlToImage"],width: 100,),
                              title: Text(news["articles"][index]["title"]),
                            ),
                          ),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("images/error.jpg"),
                              radius: 30,
                            ),
                            title: Text("Error occured"),
                          ),
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
