import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Covid extends StatefulWidget {
  const Covid({Key? key}) : super(key: key);

  @override
  State<Covid> createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  var cases = null;
  var countries = null;
  String image = "";
  String code = "";

  TextEditingController textEditingController = TextEditingController();

  void searchNews(country) async{
    String url = "https://covid-api.mmediagroup.fr/v1/cases?country=$country";

    http.get(Uri.parse(url)).then((response)  {
      setState(() {
        cases = json.decode(response.body);
        image = "http://www.geognos.com/api/en/countries/flag/${cases["All"]["abbreviation"]}.png";
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid-19"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
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
            Expanded(
                child: ListView.builder(
                    itemCount: cases == null || cases["All"] == null
                        ? 0
                        : 1,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              // backgroundImage: NetworkImage(cases["All"][index]["urlToImage"]),
                              backgroundImage: NetworkImage(image),
                              radius: 30,
                            ),
                            title: Text("Country : "+cases["All"]["country"].toString()
                                        + "\nConfirmed cases: "+cases["All"]["confirmed"].toString()
                                        + "\nDeaths cases: "+cases["All"]["deaths"].toString()),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}
