import 'package:aplikasi_modul_daring/baseApi/modul_daring_service.dart';
import 'package:aplikasi_modul_daring/model/module_dosen.dart';
import 'package:aplikasi_modul_daring/model/module_pdf.dart';

import 'package:aplikasi_modul_daring/screen/dosen/pdf_view.dart';
import 'package:aplikasi_modul_daring/screen/pdf/reader_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pdf/home_screen.dart';
import 'video.dart';
import 'pdf.dart';
import 'manage.dart';

class ModulDosen extends StatefulWidget {
  const ModulDosen({Key? key}) : super(key: key);

  @override
  State<ModulDosen> createState() => _ModulDosenState();
}

class _ModulDosenState extends State<ModulDosen> {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    'Course Module',
                    textAlign: TextAlign.center,
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
                      width: 45,
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.upload, color: Colors.white),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddModule()))
                            .then((value) {
                          getVideos();
                          getPdf();
                        });
                      },
                      label: Text('Upload Module',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 5.0),
                // Container(
                //   height: 700.0,
                //   child: GridView.count(
                //     padding: const EdgeInsets.all(25),
                //     crossAxisCount: 2,
                //     children: <Widget>[
                //       Card(
                //         margin: const EdgeInsets.all(8),
                //         child: InkWell(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => VideoPlayerScreen()));
                //           },
                //           splashColor: Colors.white,
                //           child: Center(
                //             child: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               children: const <Widget>[
                //                 Icon(
                //                   Icons.play_circle,
                //                   size: 70,
                //                   color: Colors.indigoAccent,
                //                 ),
                //                 Text("Modul 1",
                //                     style: TextStyle(
                //                         fontSize: 17.0,
                //                         fontWeight: FontWeight.bold)),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Card(
                //         margin: const EdgeInsets.all(8),
                //         child: InkWell(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => ModulScreen()));
                //           },
                //           splashColor: Colors.white,
                //           child: Center(
                //             child: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               children: const <Widget>[
                //                 Icon(
                //                   Icons.chrome_reader_mode,
                //                   size: 70,
                //                   color: Colors.indigoAccent,
                //                 ),
                //                 Text("Modul 2",
                //                     style: TextStyle(
                //                         fontSize: 17.0,
                //                         fontWeight: FontWeight.bold)),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Card(
                //         margin: const EdgeInsets.all(8),
                //         child: InkWell(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => VideoPlayerScreen()));
                //           },
                //           splashColor: Colors.white,
                //           child: Center(
                //             child: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               children: const <Widget>[
                //                 Icon(
                //                   Icons.chrome_reader_mode,
                //                   size: 70,
                //                   color: Colors.indigoAccent,
                //                 ),
                //                 Text("Modul 3",
                //                     style: TextStyle(
                //                         fontSize: 17.0,
                //                         fontWeight: FontWeight.bold)),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       Card(
                //         margin: const EdgeInsets.all(8),
                //         child: InkWell(
                //           onTap: () {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => ModulScreen()));
                //           },
                //           splashColor: Colors.white,
                //           child: Center(
                //             child: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               children: const <Widget>[
                //                 Icon(
                //                   Icons.play_circle,
                //                   size: 70,
                //                   color: Colors.indigoAccent,
                //                 ),
                //                 Text("Modul 4",
                //                     style: TextStyle(
                //                         fontSize: 17.0,
                //                         fontWeight: FontWeight.bold)),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
                Center(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listModuleVideo.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            print(listModuleVideo.length);
                            var item = listModuleVideo[index];
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('Page ' +
                                      listModuleVideo[index].judulModul);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => VideoPlayerScreen(
                                              moduleModel: item,
                                            )),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 0.5,
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  height: height * 0.2,
                                  width: width * 0.1,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      Container(
                                          width: width * 0.2,
                                          child: Image.network(
                                              listModuleVideo[index].icon)),
                                      Text(listModuleVideo[index].judulModul)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),

                //PDF List
                SizedBox(height: height * 0.1),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listModulePdf.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            print(listModulePdf.length);
                            var itemPdf = listModulePdf[index];
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('Page ' +
                                      listModulePdf[index].judulModul);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ReaderScreen(
                                              pdfModel: itemPdf,
                                            )),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 0.5,
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  height: height * 0.2,
                                  width: width * 0.1,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      Container(
                                          width: width * 0.2,
                                          child: Image.network(
                                              listModulePdf[index].icon)),
                                      Text(listModulePdf[index].judulModul)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
              ],
            ),
    );
  }
}

class AddQuiz extends StatefulWidget {
  const AddQuiz({Key? key}) : super(key: key);

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
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
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Form Add Quiz',
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
                  Icons.quiz,
                  size: 150,
                  color: Colors.indigoAccent,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Question',
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Enter the question',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
            SizedBox(height: 30),
            Text(
              'Answer',
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Enter the answer',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
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
