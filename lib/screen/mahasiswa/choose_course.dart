import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikasi_modul_daring/config/api.dart';

import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/city_test.dart';
import '../../model/jurusan.dart';
import '../../model/major.dart';
import '../../model/prodi.dart';
import '../../model/province_test.dart';

class ChooseCourse extends StatefulWidget {
  @override
  _ChooseCourseState createState() => _ChooseCourseState();
}

class _ChooseCourseState extends State<ChooseCourse> {
  String? idJur;

  final String? apiKey =
      "72635bc6abd2f06060dfbd9306dbb1bec92495d75246d74d572259588cbd0da0";

  // final String baseUrl = "http://192.168.1.13";
  final String urlJurusan =
      "http://10.170.2.3/api_modul_daring/read/read.php";
  final String urlProdi =
      "";

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
                            onChanged: (value) => idJur = value?.id_jurusan as String?,

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

                            //selectedItem: nama_jurusan.toString().,
                          )

                          // child: CustomDropdownButton2 (

                          //   buttonDecoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                          //   color: Colors.blueGrey[100],
                          // ),
                          // icon: Icon(
                          //   Icons.arrow_drop_down,
                          //   color: Colors.blueGrey,
                          //   size: 20,
                          // ),

                          // dropdownWidth: 290,
                          //   buttonWidth: 330,
                          //   buttonHeight: 54,
                          //   hint: 'Major',
                          //   dropdownItems: [],

                          //   value:"",
                          //   onChanged: (value) async {
                          //     print(value);
                          //   },

                          // ),
                          ),

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
                            onChanged: (value) => print(value?.toJson()),

                            dropdownBuilder: (context, selectedItem) => Text(
                                selectedItem?.namaProdi ??
                                    "SELECT YOUR PROGRAM STUDY"),
                            asyncItems: (String filter) async {
                              final response =
                                  await http.get(Uri.parse("http://10.170.2.3/api_modul_daring/read/read_prodi.php"));
                              if (response.statusCode != 200) {
                                return [];
                              }
                              List allProdi = (json.decode(response.body)
                                  as Map<String, dynamic>)["content"];

                              List selectedAllProdi = allProdi.firstWhere((element)=> element["id_prodi"] == "7");

                              List<Prodi> modelProdi = [];
                              print(allProdi);
                              //List<Major> allNameProdi = [];
                              selectedAllProdi.forEach((element) {
                              
                              
                                
                                modelProdi.add(Prodi(
                                    idProdi: element["id_prodi"],
                                    namaProdi: element["nama_prodi"], 
                                    idJurusan: element["id_jurusan"]));
                              });

                              return modelProdi;
                            },

                            //selectedItem: nama_jurusan.toString().,
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
                        // child: CustomDropdownButton2(
                        //   buttonDecoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        //   color: Colors.blueGrey[100],
                        // ),
                        // icon: Icon(
                        //   Icons.arrow_drop_down,
                        //   color: Colors.blueGrey,
                        //   size: 20,
                        // ),
                        // dropdownWidth: 290,
                        //   buttonWidth: 330,
                        //   buttonHeight: 54,
                        //   hint: 'Course',
                        //   dropdownItems: items_major,
                        //   value: course,
                        //   onChanged: (value) {
                        //     print(value);
                        //   setState(() {
                        //   course = value;
                        //     });
                        //   },
                        // ),
                      ),

                      SizedBox(height: 25),
                      Text(
                        "Choose Course :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      // dropdown multi select
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownSearch<String>.multiSelection(
                          items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Course'),
                          ),
                          popupProps: PopupPropsMultiSelection.menu(
                            showSearchBox: true,
                            showSelectedItems: true,
                            // disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          onChanged: (value) => print(value),

                          // selectedItems: ["Brazil"],
                        ),
                      )

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
