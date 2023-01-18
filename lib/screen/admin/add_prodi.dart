import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/major.dart';
import '../../model/prodi.dart';
import '../../model/user_admin.dart';
import '../../model/user_mhs.dart';
import '../login/login.dart';
// import 'package:aplikasi_modul_daring/screen/admin/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:aplikasi_modul_daring/config/api.dart';
import 'package:aplikasi_modul_daring/screen/Admin/dashboard_Admin.dart';

import 'add_Prodi.dart';

class ProdiData extends StatefulWidget {
  const ProdiData({Key? key}) : super(key: key);
  @override
  State<ProdiData> createState() => _ProdiDataState();
}

class _ProdiDataState extends State<ProdiData> {
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
                'Data Prodi',
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
                        MaterialPageRoute(builder: (context) => AddProdi()));
                  },
                  label: Text('Add Prodi',
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
                    'Prodi Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1.')),
                    DataCell(Text('D3 Teknik Informatika')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2.')),
                    DataCell(Text('D3 Teknik Mesin')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3.')),
                    DataCell(Text('D3 Teknik Elektro')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4.')),
                    DataCell(Text('D3 Akutansi')),
                  ]),
                ],
              ),
            ),
          ],
        ));
  }
}

class AddProdi extends StatefulWidget {
  @override
  _AddProdiState createState() => _AddProdiState();
}

class _AddProdiState extends State<AddProdi> {
  final TextEditingController jurusan = TextEditingController();

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Form Add Study Program',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.science,
                    size: 100,
                    color: Colors.indigoAccent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Choose Major :",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Container(
                alignment: Alignment.center,
                child: DropdownSearch<Major>(
                  popupProps: PopupProps.dialog(
                    showSearchBox: true,
                    // showSelectedItems: true,
                    itemBuilder: (context, item, isSelected) => ListTile(
                      title: Text(item.nama_jurusan),
                    ),
                  ),
                  onChanged: (value) => print(value?.toJson()),
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.nama_jurusan ?? "SELECT YOUR MAJOR"),
                  asyncItems: (String filter) async {
                    final response = await http.get(Uri.parse(
                        'http://192.168.1.7/api_modul_daring/jurusan/read.php'));
                    if (response.statusCode != 200) {
                      return [];
                    }
                    List allJurusan = (json.decode(response.body)
                        as Map<String, dynamic>)["content"];

                    List<Major> modelJurusan = [];
                    print(allJurusan);
                    //List<Major> allNameJurusan = [];
                    allJurusan.forEach((element) {
                      modelJurusan.add(Major(
                          id_jurusan: element["id_jurusan"],
                          nama_jurusan: element["nama_jurusan"]));
                    });

                    return modelJurusan;
                  },
                )),
            SizedBox(height: 25),
            Text(
              'Study Program',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Study program cannot be empty!";
                }
              },
              controller: jurusan,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[50],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Enter the study Program',
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
