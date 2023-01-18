import 'package:aplikasi_modul_daring/screen/mahasiswa/pilih_matkul.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Constanta/Constanta.dart';
import '../../model/user_mhs.dart';
import 'change_pass.dart';
import 'dashboard_mahasiswa.dart';
import 'dropdown_search.dart';
import 'package:aplikasi_modul_daring/screen/login/login.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final Mahasiswa mahasiswa;

  SideBar({Key? key, required this.mahasiswa}) : super(key: key);
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final storage = FlutterSecureStorage();
  Mahasiswa mahasiswa = Mahasiswa(
      alamatMhs: '',
      emailMhs: '',
      idMhs: '',
      nimMhs: '',
      noHpmhs: '',
      password: '',
      username: '');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.mahasiswa.username),
            accountEmail: Text(widget.mahasiswa.nimMhs),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.white),
            decoration: new BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardMahasiswa()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text("Enroll Course"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChooseCourseTest()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("My Course"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChooseCourseTest()));
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
            onTap: () async{
              await storage.delete(key: Constanta().keyUsernameMahasiswa);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
