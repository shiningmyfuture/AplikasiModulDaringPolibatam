import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/major.dart';
import '../../model/prodi.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  String? idJur;
  String? idPro;
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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Form Add Course',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.view_module,
                        size: 150,
                        color: Colors.indigoAccent,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        "Choose Major :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: DropdownSearch<Major>(
                            popupProps: PopupProps.dialog(
                              showSearchBox: true,
                              // showSelectedItems: true,
                              itemBuilder: (context, item, isSelected) =>
                                  ListTile(
                                title: Text(item.nama_jurusan),
                              ),
                            ),
                            onChanged: (value) {
                              idJur = value?.id_jurusan.toString();
                              // print(idJur);
                            },
                            // => print(allJurusan?.id_jurusan),

                            dropdownBuilder: (context, selectedItem) => Text(
                                selectedItem?.nama_jurusan ??
                                    "SELECT YOUR MAJOR"),
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
                        "Choose Study Program :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.center,
                          child: DropdownSearch<Prodi>(
                            popupProps: PopupProps.dialog(
                              showSearchBox: true,
                              // showSelectedItems: true,
                              itemBuilder: (context, item, isSelected) =>
                                  ListTile(
                                title: Text(item.namaProdi),
                              ),
                            ),
                            onChanged: (value) {
                              idPro = value?.idProdi.toString();
                              // print(idJur);
                            },
                            dropdownBuilder: (context, selectedItem) => Text(
                                selectedItem?.namaProdi ?? "SELECT YOUR PRODI"),
                            asyncItems: (String filter) async {
                              print("CEK ID");
                              print(idJur);
                              final response = await http.get(Uri.parse(
                                  "http://192.168.1.7/api_modul_daring/read/read_test.php?id_jurusan=$idJur"));
                              if (response.statusCode != 200) {
                                return [];
                              }
                              List allProdi = (json.decode(response.body)
                                  as Map<String, dynamic>)["content"];

                              List<Prodi> modelProdi = [];
                              print(allProdi);
                              //List<Prodi> allNameJurusan = [];
                              allProdi.forEach((element) {
                                modelProdi.add(Prodi(
                                    idJurusan: element["id_jurusan"],
                                    namaProdi: element["nama_prodi"],
                                    idProdi: element["id_prodi"]));
                              });

                              return modelProdi;
                            },
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Course Code',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Enter The Course Code*',
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Course Name',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Enter The Course Name*',
                        ),
                      ),
                      SizedBox(height: 50),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
          ),
        ));
  }
}
