import 'package:flutter/material.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_admin.dart';
import '../../model/user_mhs.dart';
import '../login/login.dart';
// import 'package:aplikasi_modul_daring/screen/admin/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:aplikasi_modul_daring/config/api.dart';
import 'package:aplikasi_modul_daring/screen/Admin/dashboard_Admin.dart';

import 'add_major.dart';

class MajorData extends StatefulWidget {
  const MajorData({Key? key}) : super(key: key);
  @override
  State<MajorData> createState() => _MajorDataState();
}

class _MajorDataState extends State<MajorData> {
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
                  "Admin",
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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Data Major',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                TextButton.icon(
                  icon: Icon(Icons.add, color: Colors.white),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddMajor()));
                  },
                  label: Text('Add Major',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                    'No.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    'Major Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1.')),
                    DataCell(Text('Teknik Informatika')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2.')),
                    DataCell(Text('Teknik Mesin')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3.')),
                    DataCell(Text('Teknik Elektro')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4.')),
                    DataCell(Text('Manajemen Bisnis')),
                  ]),
                ],
              ),
            ),
          ],
        ));
  }
}
