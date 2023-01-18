import 'dart:convert';

import 'package:aplikasi_modul_daring/screen/mahasiswa/course_mhs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_guest.dart';
import '../mahasiswa/pilih_matkul.dart';
import 'modul_guest.dart';
import 'package:flutter/material.dart';
import 'dropdown_search.dart';
import 'sidebar.dart';

class DashboardGuest extends StatefulWidget {
  const DashboardGuest({Key? key}) : super(key: key);

  @override
  State<DashboardGuest> createState() => _DashboardGuestState();
}

class _DashboardGuestState extends State<DashboardGuest> {
  final storage = FlutterSecureStorage();
  bool isLoading = true;

  Guest guest = Guest(password: '', username: '', emailGuest: '', idGuest: '');

  @override
  void initState() {
    // TODO: implement initState
    loadDataGuest();

    super.initState();
  }

  void loadDataGuest() async {
    String? username = await storage.read(key: Constanta().keyUsernameGuest);
    guest.username = username!;
    var requestBody = jsonEncode(guest);
    ModulDaringAPIService().getGuestDataByUsername(requestBody).then((result) {
      setState(() {
        isLoading = true;
      });
      if (result.success) {
        guest = Guest.fromJson(result.content);
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
                guest.username,
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
            padding: EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          SingleChildScrollView(
            child: Container(
              height: 700.0,
              child: GridView.count(
                padding: const EdgeInsets.all(25),
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    margin: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseCourseTest()));
                      },
                      splashColor: Colors.grey,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.add_box,
                              size: 70,
                              color: Colors.indigoAccent,
                            ),
                            Text("Enroll Course",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
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
                                builder: (context) => MyCourseMhs()));
                      },
                      splashColor: Colors.grey,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.book,
                              size: 70,
                              color: Colors.indigoAccent,
                            ),
                            Text("My Course",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                "Hi, " + guest.username,
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
