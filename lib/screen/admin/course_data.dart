import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_admin.dart';
import 'add_course.dart';

class CourseData extends StatefulWidget {
  const CourseData({Key? key}) : super(key: key);

  @override
  State<CourseData> createState() => _CourseDataState();
}

class _CourseDataState extends State<CourseData> {
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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Course Data',
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
                        MaterialPageRoute(builder: (context) => AddCourse()));
                  },
                  label: Text('Add Course',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            SizedBox(
              height: 10,
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
                  onPressed: () {},
                  label: Text('Add From File XLS/XLSX',
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
                    'Course Code',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    'Course Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1.')),
                    DataCell(Text('IF102')),
                    DataCell(Text('Dasar Pemrograman')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2.')),
                    DataCell(Text('MJ02')),
                    DataCell(Text('Broadcasting')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3.')),
                    DataCell(Text('AN198')),
                    DataCell(Text('Dasar Gambar')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4.')),
                    DataCell(Text('TRPL121')),
                    DataCell(Text('admin4@gmail.com')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5.')),
                    DataCell(Text('RKS121')),
                    DataCell(Text('Biometrik')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('6.')),
                    DataCell(Text('GM5261')),
                    DataCell(Text('Dasar Pembuatan Peta')),
                  ])
                ],
              ),
            ),
          ],
        ));
  }
}
