import 'package:flutter/material.dart';
import 'package:gestion_produits/Pages/about.dart';
import 'package:gestion_produits/Pages/covid.dart';
import 'package:gestion_produits/Pages/github_users.dart';
import 'package:gestion_produits/Pages/home.dart';
import 'package:gestion_produits/Pages/news.dart';
import 'package:gestion_produits/Pages/produits.dart';
import 'package:gestion_produits/Providers/list_produit_state.dart';
import 'package:provider/provider.dart';

import 'Providers/list_covid_state.dart';
import 'Providers/list_github_state.dart';
import 'Providers/list_news_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProduitState()),
        ChangeNotifierProvider(create: (context) => ListNewsState()),
        ChangeNotifierProvider(create: (context) => ListGithubState()),
        ChangeNotifierProvider(create: (context) => ListCovidtState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/" : (context) => Home(),
          "/produits" : (context) => Produits(),
          "/github_users" : (context) => GitHubUsers(),
          "/news" : (context) => News(),
          "/covid" : (context) => Covid(),
          "/about" : (context) => About(),
        },
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
      ),
    );
  }
}
