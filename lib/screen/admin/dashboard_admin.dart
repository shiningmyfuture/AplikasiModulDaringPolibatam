import 'dart:convert';

import 'package:aplikasi_modul_daring/model/user_admin.dart';
import 'package:flutter/material.dart';
import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import 'add_prodi.dart';
import 'data_major.dart';
import 'sidebar.dart';
import 'course_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'user.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final storage = FlutterSecureStorage();
  bool isLoading = true;

  Admin admin = Admin(
      password: '',
      username: '',
      alamatAdmin: '',
      emailAdmin: '',
      idAdmin: '',
      noHpadmin: '');

  void initState() {
    // TODO: implement initState
    loadDataAdmin();

    super.initState();
  }

  void loadDataAdmin() async {
    String? username = await storage.read(key: Constanta().keyUsernameAdmin);
    admin.username = username!;
    var requestBody = jsonEncode(admin);
    ModulDaringAPIService().getAdminDataByUsername(requestBody).then((result) {
      setState(() {
        isLoading = true;
      });
      if (result.success) {
        admin = Admin.fromJson(result.content);
        // loadDataMahasiswa();
      } else {
        print(result.message);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(width: 10.0, height: 50.0),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                admin.username,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
          ),
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
        backgroundColor: Colors.blueAccent[400],
      ),
      drawer: SideBar(),
      body: ListView(
        children: <Widget>[
          _top(),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 700.0,
            child: GridView.count(
              padding: const EdgeInsets.all(25),
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserPage()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.people,
                            size: 70,
                            color: Colors.indigoAccent,
                          ),
                          Text("User",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CourseData()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.view_module,
                            size: 70,
                            color: Colors.indigoAccent,
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              "Manage\nCourse",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MajorData()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.school,
                            size: 70,
                            color: Colors.indigoAccent,
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              "Manage\nMajor",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProdiData()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.science,
                            size: 70,
                            color: Colors.indigoAccent,
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              "Manage Study Program",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent[400],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10.0, height: 50.0),
              Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10.0, height: 10.0),
              Text(
                "Hi, " + admin.username,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ],
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
