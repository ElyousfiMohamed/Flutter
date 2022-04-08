import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_produits/widgets/drawer_item.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,30,0,0),
              child: DrawerHeader(child: Column(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/02-min.jpg"),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text("Mohamed ELYOUSFI"),
                ],
              )),
            ),
            DrawerItem("Home","/",Icon(Icons.home)),
            DrawerItem("Produits","/produits",Icon(Icons.contacts)),
            DrawerItem("Github Users","/github_users",Icon(Icons.supervised_user_circle)),
            DrawerItem("News","/news",Icon(Icons.newspaper)),
            DrawerItem("Covid-19","/covid",Icon(Icons.coronavirus)),
            DrawerItem("About","/about",Icon(Icons.error)),
          ],
        ),
      );
  }
}