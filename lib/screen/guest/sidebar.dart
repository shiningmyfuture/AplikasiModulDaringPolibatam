import '../../Constanta/Constanta.dart';
import '../../model/user_guest.dart';
import 'change_pass.dart';
import 'dashboard_guest.dart';
import 'dropdown_search.dart';
import 'change_pass.dart';
import 'dashboard_guest.dart';
import 'dropdown_search.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_modul_daring/screen/login/login.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final storage = FlutterSecureStorage();
  Guest guest = Guest(password: '', username: '', emailGuest: '', idGuest: '');
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text("Guest@gmail.com"),
            accountName: Text("Username Guest"),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.white),
            decoration: new BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardGuest()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book_online),
            title: Text("Pilih Mata Kuliah"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dropdown()));
            },
          ),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text("Change Password"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePass()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () async {
              await storage.delete(key: Constanta().keyUsernameGuest);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
