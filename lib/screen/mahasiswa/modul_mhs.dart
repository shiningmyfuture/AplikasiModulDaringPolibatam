import 'package:aplikasi_modul_daring/baseApi/modul_daring_service.dart';
import 'package:aplikasi_modul_daring/model/module_dosen.dart';
import 'package:aplikasi_modul_daring/model/module_pdf.dart';
import 'package:aplikasi_modul_daring/screen/dosen/modul.dart';
import 'package:aplikasi_modul_daring/screen/dosen/pdf_view.dart';
import 'package:aplikasi_modul_daring/screen/dosen/video.dart';
import 'package:aplikasi_modul_daring/screen/laboran/video.dart';
import 'package:flutter/cupertino.dart';

import '../../model/user_mhs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../pdf/home_screen.dart';
import 'PDF.dart';
import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'package:aplikasi_modul_daring/screen/mahasiswa/video_mhs.dart';
// import 'video_mhs.dart';

class Modulmhs extends StatefulWidget {
  const Modulmhs({Key? key}) : super(key: key);

  @override
  State<Modulmhs> createState() => _ModulmhsState();
}

class _ModulmhsState extends State<Modulmhs> {
  //Load From Database
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

  
  final storage = FlutterSecureStorage();
  Mahasiswa mahasiswa = Mahasiswa(
      alamatMhs: '',
      emailMhs: '',
      idMhs: '',
      nimMhs: '',
      noHpmhs: '',
      password: '',
      username: '');
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("My Course")),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Course Modul",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
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
          //                         fontSize: 17.0, fontWeight: FontWeight.bold)),
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
          //                     builder: (context) => ModulDosen()));
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
          //                         fontSize: 17.0, fontWeight: FontWeight.bold)),
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
          //                     builder: (context) => ModulDosen()));
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
          //                         fontSize: 17.0, fontWeight: FontWeight.bold)),
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
          //                   Icons.play_circle,
          //                   size: 70,
          //                   color: Colors.indigoAccent,
          //                 ),
          //                 Text("Modul 4",
          //                     style: TextStyle(
          //                         fontSize: 17.0, fontWeight: FontWeight.bold)),
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
                                      print('Page ' + listModuleVideo[index].judulModul);
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
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 0.5,
                                            blurRadius: 6,
                                            offset: Offset(0,
                                                2), // changes position of shadow
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
                                      print('Page ' + listModulePdf[index].judulModul);
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
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 0.5,
                                            blurRadius: 6,
                                            offset: Offset(0,
                                                2), // changes position of shadow
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
