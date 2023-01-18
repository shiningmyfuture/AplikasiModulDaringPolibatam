import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikasi_modul_daring/config/api.dart';

import '../../model/city_test.dart';
import '../../model/province_test.dart';

class ChooseJurusan extends StatefulWidget {
  @override
  _ChooseJurusanState createState() => _ChooseJurusanState();
}

class _ChooseJurusanState extends State<ChooseJurusan> {
  
  String? idProv;
  final String? apiKey =
      "72635bc6abd2f06060dfbd9306dbb1bec92495d75246d74d572259588cbd0da0";

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
                        child: DropdownSearch<Province>(
                          popupProps: PopupProps.dialog(
                            showSearchBox: true,
                            dialogProps: DialogProps(
                              backgroundColor: Colors.white,
                              elevation: 0,
                            ),
                            itemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: Text(item.name),
                            ),
                          ),
                          asyncItems: (text) async {
                            var response = await http.get(Uri.parse(
                                'https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey'));
                            if (response.statusCode != 200) {
                              return [];
                            }
                            List allProvince = (jsonDecode(response.body)
                                as Map<String, dynamic>)["value"];
                            List<Province> allModelProvince = [];
                            allProvince.forEach((element) {
                              allModelProvince.add(
                                Province(
                                  id: element["id"],
                                  name: element["name"],
                                ),
                              );
                            });
                            return allModelProvince;
                          },
                          onChanged: (value) => idProv = value?.id,
                          dropdownBuilder: (context, selectedItem) =>
                              Text(selectedItem?.name ?? "SELECT THE PROVINCE"),
                        ),

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
                        child: DropdownSearch<City>(
                          popupProps: PopupProps.dialog(
                            showSearchBox: true,
                            dialogProps: DialogProps(
                              backgroundColor: Colors.white,
                              elevation: 0,
                            ),
                            itemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: Text(item.name),
                            ),
                          ),
                          asyncItems: (text) async {
                            print("CEK ID");
                            print(idProv);
                            var response = await http.get(Uri.parse(
                               "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv"));
                            if (response.statusCode != 200) {

                              return [];
                            }
                            List allCity = (jsonDecode(response.body)
                                as Map<String, dynamic>)["value"];
                            List<City> allModelCity = [];
                            allCity.forEach((element) {
                              allModelCity.add(
                                City(
                                  id: element["id"],
                                  idProvinsi: element["id_provinsi"],
                                  name: element["name"],
                                ),
                              );
                            });
                            return allModelCity;
                          },
                          onChanged: (value) => print(value?.toJson()),
                          dropdownBuilder: (context, selectedItem) =>
                              Text(selectedItem?.name ?? "SELECT THE CITY"),
                        ),
                      ),
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
