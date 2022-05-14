import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_produits/Pages/newsDetail.dart';
import 'package:gestion_produits/Providers/list_news_state.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class News extends StatelessWidget {
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        onChanged : (String value) async {
                          Provider.of<ListNewsState>(context, listen: false)
                              .searchNews(value);
                        },
                        controller: Provider
                            .of<ListNewsState>(context, listen: false)
                            .textEditingController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.green
                                  .shade400)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.green
                                  .shade400)),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
                child: Consumer<ListNewsState>(builder: (context, ListNewsState, child) {
                  return ListView.builder(
                      itemCount: ListNewsState.news == null || ListNewsState.news["articles"] == null
                          ? 0
                          : ListNewsState.news["articles"].length,
                      itemBuilder: (context, index) {
                        if (ListNewsState.news["articles"][index]["urlToImage"] != null &&
                            ListNewsState.news["articles"][index]["title"] != null) {
                          return Card(
                            elevation: 1,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NewsDetail(ListNewsState.news["articles"][index]),
                                      )
                                  );
                                },
                                leading: Image.network(
                                  ListNewsState.news["articles"][index]["urlToImage"],
                                  width: 100,),
                                title: Text(ListNewsState.news["articles"][index]["title"]),
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
                      });
                }))
          ],
        ),
      ),
    );
  }
}