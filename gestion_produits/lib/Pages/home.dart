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
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(80,200,10,0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/produits");
                    },
                    child:  const CircleAvatar(
                      backgroundImage: AssetImage("images/1 (1).jpg"),
                      radius: 50,),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/news");
                    },
                    child:  const CircleAvatar(
                      backgroundImage: AssetImage("images/1 (2).jpg"),
                      radius: 55,),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,190,80,0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/github_users");
                  },
                  child:  const CircleAvatar(
                    backgroundImage: AssetImage("images/1 (3).jpg"),
                    radius: 55,),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/covid");
                  },
                  child:  const CircleAvatar(
                    backgroundImage: AssetImage("images/1 (4).jpg"),
                    radius: 65,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
