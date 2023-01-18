import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text("admin@gmail.com"),
            accountName: Text("Username Admin"),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.white),
          )
        ],
      ),
    );
  }
}
