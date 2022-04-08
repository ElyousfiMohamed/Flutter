import 'package:flutter/material.dart';
import 'package:gestion_produits/widgets/app_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.green,
          onPressed: () {
            Navigator.pushNamed(context, "/produits");
          },
          child: const Padding(
            padding: EdgeInsets.fromLTRB(10,15,10,15),
            child: Text("Produits",style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

}