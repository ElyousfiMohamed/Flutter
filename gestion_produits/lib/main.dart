import 'package:flutter/material.dart';
import 'package:gestion_produits/Pages/about.dart';
import 'package:gestion_produits/Pages/covid.dart';
import 'package:gestion_produits/Pages/github_users.dart';
import 'package:gestion_produits/Pages/home.dart';
import 'package:gestion_produits/Pages/news.dart';
import 'package:gestion_produits/Pages/newsDetail.dart';
import 'package:gestion_produits/Pages/produits.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Home(),
        "/produits" : (context) => const Produits(),
        "/github_users" : (context) => const GitHubUsers(),
        "/news" : (context) => const News(),
        "/covid" : (context) => const Covid(),
        "/about" : (context) => const About(),
      },
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
    );
  }
}
