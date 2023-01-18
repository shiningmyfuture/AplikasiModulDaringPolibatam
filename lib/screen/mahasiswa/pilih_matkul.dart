import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikasi_modul_daring/Constanta/Constanta.dart';
import 'package:aplikasi_modul_daring/config/api.dart';

import '../../model/major.dart';
import '../../model/prodi.dart';
import '../../model/course.dart';

class ChooseCourseTest extends StatefulWidget {
  @override
  _ChooseCourseTestState createState() => _ChooseCourseTestState();
}

class _ChooseCourseTestState extends State<ChooseCourseTest> {
  String? idJur;
  String? idPro;
  String? idMatkul;
  final String urlJurusan = "${Constanta().apiUrl}jurusan/read.php";

  final String urlProdi = "${Constanta().apiUrl}read/read_test.php?id_jurusan=";

  final String urlMatkul =
      "${Constanta().apiUrl}matkul/read_matkul.php?id_prodi=";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enroll Course")),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white30,
          height: 550,
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "ENROLL YOUR COURSE",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
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
                              final response =
                                  await http.get(Uri.parse(urlJurusan));
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

                              //SELECT YOUR PRODI
                              final response = await http
                                  .get(Uri.parse(urlProdi + "$idJur"));
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

                      SizedBox(height: 25),
                      Text(
                        "Choose Course :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),

                      Container(
                          alignment: Alignment.center,
                          child: DropdownSearch<MataKuliah>(
                            popupProps: PopupProps.dialog(
                              showSearchBox: true,
                              // showSelectedItems: true,
                              itemBuilder: (context, item, isSelected) =>
                                  ListTile(
                                title: Text(item.namaMatkul),
                              ),
                            ),
                            onChanged: (value) => print(value?.toJson()),
                            dropdownBuilder: (context, selectedItem) => Text(
                                selectedItem?.namaMatkul ??
                                    "SELECT YOUR COURSE"),
                            asyncItems: (String filter) async {
                              print("CEK ID");
                              print(idPro);
                              final response = await http
                                  .get(Uri.parse(urlMatkul + "$idPro"));
                              if (response.statusCode != 200) {
                                return [];
                              }
                              List allMatkul = (json.decode(response.body)
                                  as Map<String, dynamic>)["content"];

                              List<MataKuliah> modelMatkul = [];
                              print(allMatkul);
                              //List<Matkul> allNameJurusan = [];
                              allMatkul.forEach((element) {
                                modelMatkul.add(MataKuliah(
                                    idProdi: element["id_prodi"],
                                    kodeMatkul: element["kode_matkul"],
                                    namaMatkul: element["nama_matkul"],
                                    idMatkul: element["id_matkul"]));
                              });

                              return modelMatkul;
                            },
                          )),

                      SizedBox(height: 25),
                      // Text(
                      //   "Choose Course :",
                      //   style: TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.w600),
                      // ),
                      // SizedBox(height: 10),

                      // SizedBox(height: 25),
                      // Text(
                      //   "Choose Course :",
                      //   style: TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.w600),
                      // ),
                      // SizedBox(height: 10),
                      // // dropdown multi select
                      // Container(
                      //   height: 54,
                      //   decoration: BoxDecoration(
                      //       color: Colors.blueGrey[100],
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: DropdownSearch<String>.multiSelection(
                      //     items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                      //     dropdownDecoratorProps: DropDownDecoratorProps(
                      //       dropdownSearchDecoration: InputDecoration(
                      //           border: InputBorder.none, hintText: 'Course'),
                      //     ),
                      //     popupProps: PopupPropsMultiSelection.menu(
                      //       showSearchBox: true,
                      //       showSelectedItems: true,
                      //       // disabledItemFn: (String s) => s.startsWith('I'),
                      //     ),
                      //     onChanged: (value) => print(value),

                      //     // selectedItems: ["Brazil"],
                      //   ),
                      // )

                      //end dropdown
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
