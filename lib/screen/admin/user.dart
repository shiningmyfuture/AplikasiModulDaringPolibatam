import 'dart:convert';

import 'package:flutter/material.dart';
import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_admin.dart';
import 'admin_data.dart';
import 'lecturer_data.dart';
import 'laboratory_data.dart';
import 'student_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'guest_data.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Application User",
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
                          MaterialPageRoute(builder: (context) => AdminData()));
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
                          Text("ADMIN",
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
                              builder: (context) => LecturerData()));
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
                          Text("LECTURER",
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
                              builder: (context) => LaboratoryData()));
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
                          Text("LABORATORY",
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
                              builder: (context) => StudentData()));
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
                          Text("STUDENT",
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
                          MaterialPageRoute(builder: (context) => GuestData()));
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
                          Text("GUEST",
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
}
