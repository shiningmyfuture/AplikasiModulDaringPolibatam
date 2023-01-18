// import 'package:aplikasi_modul_daring/screen/pdf/reader_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:/model/doc_modul.dart';
// // import 'package:screen/reader_screen.dart';

// import '../../model/document_model.dart';

// class ModulScreen extends StatefulWidget {
//   const ModulScreen({super.key});

//   @override
//   State<ModulScreen> createState() => _ModulScreenState();
// }

// class _ModulScreenState extends State<ModulScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(Icons.arrow_back)),
//           title: Text("PDF Reader"),
//         ),
//         body: Padding(
//             padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Recent Documents",
//                   ),
//                   Column(
//                     children: Document.doc_list
//                         .map((doc) => ListTile(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             ReaderScreen(doc)));
//                               },
//                               title: Text(
//                                 doc.doc_title!,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               subtitle: Text("${doc.page_num!} Pages"),
//                               trailing: Text(
//                                 doc.doc_date!,
//                               ),
//                               leading: Icon(
//                                 Icons.picture_as_pdf,
//                                 color: Colors.red,
//                                 size: 35.0,
//                               ),
//                             ))
//                         .toList(),
//                   )
//                 ],
//               ),
//             )));
//   }
// }
