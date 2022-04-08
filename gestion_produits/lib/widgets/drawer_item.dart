import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String name;
  String route;
  Icon icon;

  DrawerItem(this.name,this.route,this.icon, {Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: icon,
        title:  Text(name),
        onTap: () {
          Navigator.popAndPushNamed(context, route);
        });
    }
}