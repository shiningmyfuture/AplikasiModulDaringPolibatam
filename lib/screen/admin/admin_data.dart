import 'package:aplikasi_modul_daring/screen/admin/add_admin.dart';
import 'package:flutter/material.dart';

class AdminData extends StatefulWidget {
  const AdminData({Key? key}) : super(key: key);

  @override
  State<AdminData> createState() => _AdminDataState();
}

class _AdminDataState extends State<AdminData> {
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
                   "Admin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0), ),
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
            child: Text('Data Admin',
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
               MaterialPageRoute(builder: (context) => SignUpAdmin()));
                },
                label: 
                Text('Add Admin',
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
                  DataCell(Text('Admin1')),
                  DataCell(Text('admin1@gmail.com')),
                  DataCell(Text('Gangnam Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2.')),
                  DataCell(Text('Admin2')),
                  DataCell(Text('admin2@gmail.com')),
                  DataCell(Text('Batam Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3.')),
                  DataCell(Text('Admin3')),
                  DataCell(Text('admin3@gmail.com')),
                  DataCell(Text('Jakarta Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4.')),
                  DataCell(Text('Admin4')),
                  DataCell(Text('admin4@gmail.com')),
                  DataCell(Text('Gangnam Selatan')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5.')),
                  DataCell(Text('Admin5')),
                  DataCell(Text('admin4@gmail.com')),
                  DataCell(Text('Bandung')),
                  DataCell(Text('081272727321')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6.')),
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