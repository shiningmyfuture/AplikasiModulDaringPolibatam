import 'package:aplikasi_modul_daring/model/major.dart';
import 'package:aplikasi_modul_daring/model/major.dart';
import 'package:aplikasi_modul_daring/model/major.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:aplikasi_modul_daring/config/api.dart';

import '../../baseApi/modul_daring_service.dart';
import '../../model/jurusan.dart';
import '../../model/major.dart';


class EnrollCourse extends StatefulWidget {
  @override
  _EnrollCourseState createState() => _EnrollCourseState();
}

class _EnrollCourseState extends State<EnrollCourse> {
  String? selectedValue;
  late List<Jurusan> listJurusan;
  // late List<Major> list_m;
  // late List<Major> listJurusan;
  List majorList = [];
  List <String> items_major = [];
  List <String> items_prodi = [];
  List <String> items_matkul = [];

  // getJurusan() async {
  //   try {
  //     final response = await http.get(
  //         Uri.parse("https://api.sobatcoding.com/testing/cities"),
  //         headers: {
  //           'Content-Type': 'application/json; charset=UTF-8',
  //         });

  //     if (response.statusCode == 200) {
  //       final dataDecode = jsonDecode(response.body);
  //       setState(() {
  //         for (var i = 0; i < dataDecode.length; i++) {
  //           listJurusan.add(Major.fromJson(dataDecode[i]));
  //         }
  //       });
  //     }
  //   } catch (e) {
  //     debugPrint('$e');
  //   }
  // }
  void getDataJurusan(){
    ModulDaringAPIService().getJurusanData(null).then((result) {
      if (result.success) {
        listJurusan = List<Jurusan>.from(
            result.content.map((x) => Jurusan.fromJson(x)));
        print(listJurusan.length);
        print(listJurusan);
      } else {
        print(result.message);
      }
      // setState(() {
      //   // isLoading = false;
      // });
    });
  }

//   Future getAllMajor() async{
//     var url = "";
//     print(api.host+"/jurusan/get_jurusan.php");
//     var response = await http.get(Uri.parse(api.host+"/jurusan/get_jurusan.php"));
//     if (response.statusCode == 200){
//      var jsonData = jsonDecode(response.body);
//      jsonData.forEach((nama_jurusan){print('asasas${nama_jurusan}');});
// //         jsonData.forEach((key, value){
// //           print("ini testnya disini");
// //          print(value['key']);
// //           print(value['data']);
// // // items_major.add(v["nama_jurusan"]);
// //         });
//       return jsonData;
//     }
//   }

//   Future getAllProdi() async{
//     var url = "";
//     print(api.host+"/prodi/get_prodi.php");
//     var response = await http.get(Uri.parse(api.host+"/prodi/get_prodi.php?id_jurusan=7"));
//     if (response.statusCode == 200){
//       var jsonData = jsonDecode(response.body);
     
//       return jsonData["data"];
//     }
//   }

//   Future getAllMatkul() async{
//     var url = "";
//     print(api.host+"/matkul/get_matkul.php");
//     var response = await http.get(Uri.parse(api.host+"/matkul/get_matkul.php?id_matkul=13"));
//     if (response.statusCode == 200){
//       var jsonData = jsonDecode(response.body);
//       return jsonData["data"];
//     }
//   }

  String? major;
  String? prodi;
  String? course;



  final List<String> items = [
    'Admin',
    'Lecturer',
    'Laboratory',
    'Student',
    'Guest',
  ];

  bool visible = false;
      
      // @override
    
      // void initState() {
      //   getMajor() async {
      //       final response = await http.get(Uri.parse(api.host+"/jurusan/get_jurusan.php"));
    
      //       if (response.statusCode == 200){
      //         final dataDecode = jsonDecode(response.body);
      //         print(response.body);
      //         setState(() {
      //                     for (var i=0; i < dataDecode.length; i++){
      //                       print(dataDecode[i]);
      //                     }
      //                   });
      //       }
      //   }
      //   getMajor();
      //   super.initState();
    
      // }
      @override
      void initState(){
        getDataJurusan();
      //  getAllMajor().then((value) => {
      //      value.forEach((v) {
      //        print(v["nama_jurusan"]);
      //        items_major.add(v["nama_jurusan"]);
      //      })
      //    });

        // getAllProdi().then((value) => {
        //    value.forEach((v) {
        //      print(v["nama_prodi"]);
        //      items_prodi.add(v["nama_prodi"]);
        //    })
        //  });
         
        // getAllMatkul().then((value) => {
        //    value.forEach((v) {
        //      print(v["nama_matkul"]);
        //      items_matkul.add(v["nama_matkul"]);
        //    })
        //  });
        //  getJurusan();
        super.initState();
      }
      
      Widget build(BuildContext context) {
        // getAllMajor().then((value) => {
        //    value.forEach((v) {
        //      print(v["nama_jurusan"]);
        //      items_major.add(v["nama_jurusan"]);
        //    })
        //  });

        // getAllProdi().then((value) => {
        //    value.forEach((v) {
        //      print(v["nama_prodi"]);
        //      items_prodi.add(v["nama_prodi"]);
        //    })
        //  });
         
        // getAllMatkul().then((value) => {
        //    value.forEach((v) {
        //      print(v["nama_matkul"]);
        //      items_matkul.add(v["nama_matkul"]);
        //    })
        //  });
        return Scaffold(
          appBar: AppBar(title: Text("Enroll Course")),
          body: SingleChildScrollView(
                  child: Container(
              color: Colors.white30,
              height: 550,
            margin: EdgeInsets.symmetric(horizontal: 20), alignment: Alignment.center,
            child: Card( 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("ENROLL YOUR COURSE",style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                      SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25),
                        Text("Choose Major :",style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Container (
                          alignment: Alignment.center,    
                          child: CustomDropdownButton2 (
                            
                            buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey[100],
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blueGrey,
                            size: 20,
                          ),
                          
                          dropdownWidth: 290,
                            buttonWidth: 330,
                            buttonHeight: 54,
                            hint: 'Major',
                            dropdownItems: [],
                          
                            value:"",
                            onChanged: (value) async {
                              print(value);
                            },
                            
                            // onChanged: (value) async{
                            //   final String jsonString = jsonEncode(major);
                            //   var url = Uri.http('10.170.5.137', 'api_modul_daring/login.php');
                            //   var response = await http.get(
                            //     Uri.parse(api.host+"/jurusan/get_jurusan.php"), 
                            //   );
                    
                            //   print('Response status: ${response.statusCode}');
                            //   print('Response body: ${response.body}');
                            //   print(value);
                            // setState((){
                              
                            //   });
                            // },
                          ),
                        ),
    
                        SizedBox(height: 25),
                        Text("Choose Study Program :",style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                        SizedBox(height: 10),
    
                        Container(
                          alignment: Alignment.center,    
                          child: CustomDropdownButton2(
                            buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey[100],
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blueGrey,
                            size: 20,
                          ),
                          dropdownWidth: 290,
                            buttonWidth: 330,
                            buttonHeight: 54,
                            hint: 'Study Program',
                            dropdownItems: items_major,
                            value: prodi,
                            onChanged: (value) {
                              print(value);
                            setState(() {
                            course = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 25),
                        Text("Choose Course :",style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.center,    
                          child: CustomDropdownButton2(
                            buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey[100],
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blueGrey,
                            size: 20,
                          ),
                          dropdownWidth: 290,
                            buttonWidth: 330,
                            buttonHeight: 54,
                            hint: 'Course',
                            dropdownItems: items_major,
                            value: course,
                            onChanged: (value) {
                              print(value);
                            setState(() {
                            course = value;
                              });
                            },
                          ),
                        ),
    
                        SizedBox(height: 25),
                        Text("Choose Course :",style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                        SizedBox(height: 10),
      // dropdown multi select
                        Container(
                        height: 54,
                          
                         decoration: BoxDecoration(
                           color: Colors.blueGrey[100],
                           borderRadius: BorderRadius.circular(10)
                         ),
                          child: DropdownSearch<String>.multiSelection(
                            items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Course'
                              ),
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
    
      static Major({required int id, required String nama_jurusan}) {}
}