import 'package:aplikasi_modul_daring/screen/admin/add_doslab.dart';
import 'package:flutter/material.dart';

class LecturerData extends StatefulWidget {
  const LecturerData({Key? key}) : super(key: key);

  @override
  State<LecturerData> createState() => _LecturerDataState();
}

class _LecturerDataState extends State<LecturerData> {
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
                   "Lecturer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0), ),
               ),
             ),
             CircleAvatar(
              radius: 15.0,
                 backgroundColor: Colors.white,
               ),
               SizedBox(width: 10,)
        ],
        elevation: 0,
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text('Lecturer Data',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              TextButton.icon(
                icon: Icon(Icons.add, color: Colors.white),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: (){
                  Navigator.push(context, 
               MaterialPageRoute(builder: (context) => SignUpDosen()));
                },
                label: 
                Text('Add Lecturer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                  )
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              TextButton.icon(
                icon: Icon(Icons.add, color: Colors.white),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: (){},
                label: 
                Text('Add From File XLS/XLSX',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                  )
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('No.',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
                DataColumn(label: Text('NIK',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
                DataColumn(label: Text('Username',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
                DataColumn(label: Text('Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
                DataColumn(label: Text('Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
                DataColumn(label: Text('Phone Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
              ],
                rows: [
                DataRow(cells: [
                  DataCell(Text('1.')),
                  DataCell(Text('21291201920101')),
                  DataCell(Text('Jamal')),
                  DataCell(Text('jamal@gmail.com')),
                  DataCell(Text('Gangnam Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2.')),
                  DataCell(Text('21218298198291')),
                  DataCell(Text('Sebastian')),
                  DataCell(Text('admin2@gmail.com')),
                  DataCell(Text('Batam Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3.')),
                  DataCell(Text('21909209103913')),
                  DataCell(Text('Admin3')),
                  DataCell(Text('admin3@gmail.com')),
                  DataCell(Text('Jakarta Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4.')),
                  DataCell(Text('21918291839183')),
                  DataCell(Text('Admin4')),
                  DataCell(Text('admin4@gmail.com')),
                  DataCell(Text('Gangnam Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5.')),
                  DataCell(Text('21297139173817')),
                  DataCell(Text('Admin5')),
                  DataCell(Text('admin4@gmail.com')),
                  DataCell(Text('Bandung')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6.')),
                  DataCell(Text('219829198318839')),
                  DataCell(Text('Admin6')),
                  DataCell(Text('admin5@gmail.com')),
                  DataCell(Text('Batam')),
                  DataCell(Text('081272727321')),
                ])
              ],
            ),
          ),
        ],
      )
        );
  }
  }