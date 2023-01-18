import 'dart:convert';

import 'package:aplikasi_modul_daring/baseApi/modul_daring_service.dart';
import 'package:aplikasi_modul_daring/model/insert_Module.dart';
import 'package:aplikasi_modul_daring/model/module_dosen.dart';
import 'package:aplikasi_modul_daring/model/module_pdf.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../mahasiswa/pilih_matkul.dart';
import 'modul.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ModuleModel> listModuleVideo;
  late List<PdfModel> listModulePdf;

  bool isLoading = true;

  @override
  void initState() {
    getVideos();
    getPdf();
    super.initState();
  }

  void getVideos() {
    setState(() {
      isLoading = true;
    });
    ModulDaringAPIService().getVideoModule(null).then((result) {
      if (result.success) {
        listModuleVideo = List<ModuleModel>.from(
            result.content.map((x) => ModuleModel.fromJson(x)));
        print(listModuleVideo.length);
      } else {
        print(result.message);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  void getPdf() {
    setState(() {
      isLoading = true;
    });
    ModulDaringAPIService().getPdfModule(null).then((result) {
      if (result.success) {
        listModulePdf = List<PdfModel>.from(
            result.content.map((x) => PdfModel.fromJson(x)));
        print(listModulePdf.length);
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
          title: const Text("Manage Course"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              SizedBox(height: 15),
              TextButton.icon(
                icon: Icon(Icons.upload, color: Colors.white),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseCourseTest()));
                },
                label: Text('Select Course',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
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
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ModulDosen()))
                              .then((value) {
                            getVideos();
                            getPdf();
                          });
                        },
                        splashColor: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Icon(
                                Icons.data_object_sharp,
                                size: 70,
                                color: Colors.indigoAccent,
                              ),
                              Text("Basis Data",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
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
                                  builder: (context) => ModulDosen())).then((value) {
                            getVideos();
                            getPdf();
                          });
                        },
                        splashColor: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Icon(
                                Icons.apps,
                                size: 60,
                                color: Colors.indigoAccent,
                              ),
                              Text(
                                "Rekayasa Perangkat Lunak",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
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
                                  builder: (context) => ModulDosen())).then((value) {
                            getVideos();
                            getPdf();
                          });
                        },
                        splashColor: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Icon(
                                Icons.web,
                                size: 70,
                                color: Colors.indigoAccent,
                              ),
                              Text("Pemrograman Web",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
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
                                  builder: (context) => ModulDosen())).then((value) {
                            getVideos();
                            getPdf();
                          });
                        },
                        splashColor: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Icon(
                                Icons.web_asset,
                                size: 70,
                                color: Colors.indigoAccent,
                              ),
                              Text(
                                "Dasar Pemrograman",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
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
                                  builder: (context) => ModulDosen()));
                        },
                        splashColor: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Icon(
                                Icons.book_online,
                                size: 70,
                                color: Colors.indigoAccent,
                              ),
                              Text(
                                "Bahasa \n Indonesia",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}

class AddModule extends StatefulWidget {
  const AddModule({Key? key}) : super(key: key);

  @override
  State<AddModule> createState() => _AddModuleState();
}

class _AddModuleState extends State<AddModule> {
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController idCourseController = TextEditingController();
  final TextEditingController typeModuleController = TextEditingController();
  final TextEditingController courseTitleController = TextEditingController();
  final TextEditingController courseDescController = TextEditingController();
  final TextEditingController urlCourseController = TextEditingController();
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
                "Lecturer",
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
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Form Add Module',
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
                  Icons.bookmark_add_outlined,
                  size: 150,
                  color: Colors.indigoAccent,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Course',
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
              controller: courseNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[50],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Course name..',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Id Course',
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
              controller: idCourseController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[50],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'id..',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Module Type',
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
              controller: typeModuleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[50],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'File* or Link*',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Course Title',
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
              controller: courseTitleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[50],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Enter the course title',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Course Description',
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
              controller: courseDescController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[50],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Enter the description',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Link URL',
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
              controller: urlCourseController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[50],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Enter the URL link!',
              ),
            ),
            SizedBox(height: 10),
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
                    onPressed: () {

                      // InsertModule insertModule = InsertModule(
                      //     idCourse: idCourseController.text,
                      //     moduleType: typeModuleController.text,
                      //     courseTitle: courseTitleController.text,
                      //     courseDesc: courseDescController.text,
                      //     courseLink: urlCourseController.text,
                      //     iconLink:
                      //         "https://cdn-icons-png.flaticon.com/512/5965/5965885.png");
                      // var requestBody = jsonEncode(insertModule);
                      // ModulDaringAPIService()
                      //     .insertModulePrakt(requestBody)
                      //     .then((result) {
                      //   if (result != null) {
                      //     if (result.success) {
                      //       // pindah halaman

                      //       print('Insert Module Success');

                      //       print(result.message);
                      //     } else {
                      //       print(result.message);
                      //       print('Insert Module Failed');
                      //     }
                      //   } else {
                      //     print("result is null");
                      //   }
                      // });
                    },
                    child: Text(
                      'Save',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
