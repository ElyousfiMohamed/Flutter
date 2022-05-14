import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ListCovidtState extends ChangeNotifier {
  var cases = null;
  var countries = null;
  String image = "";
  String code = "";

  TextEditingController textEditingController = TextEditingController();

  void searchCovid(country) async{
    String url = "https://covid-api.mmediagroup.fr/v1/cases?country=$country";

    http.get(Uri.parse(url)).then((response)  {
        cases = json.decode(response.body);
        image = "http://www.geognos.com/api/en/countries/flag/${cases["All"]["abbreviation"]}.png";
        notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }
}