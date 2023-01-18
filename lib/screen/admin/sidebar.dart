import 'package:aplikasi_modul_daring/screen/Admin/add_Prodi.dart';
import 'package:aplikasi_modul_daring/screen/admin/changepass.dart';
import 'package:flutter/material.dart';
import '../../Constanta/Constanta.dart';
import 'dashboard_admin.dart';
import 'data_major.dart';
import 'user.dart';
import 'course_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:aplikasi_modul_daring/screen/login/login.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text("Admin1@gmail.com"),
            accountName: Text("Admin1"),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.white),
            decoration: new BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardAdmin()));
            },
          ),
          ListTile(
              leading: Icon(Icons.people),
              title: Text("User"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPage()));
              }),
          ListTile(
              leading: Icon(Icons.view_module),
              title: Text("Manage Course"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CourseData()));
              }),
          ListTile(
              leading: Icon(Icons.school),
              title: Text("Manage Major"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MajorData()));
              }),
          ListTile(
              leading: Icon(Icons.science),
              title: Text("Manage Study Program"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProdiData()));
              }),
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
              await storage.delete(key: Constanta().keyUsernameAdmin);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
