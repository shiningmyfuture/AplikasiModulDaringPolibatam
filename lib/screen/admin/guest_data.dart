import 'package:aplikasi_modul_daring/screen/admin/add_guest.dart';
import 'package:flutter/material.dart';

class GuestData extends StatefulWidget {
  const GuestData({Key? key}) : super(key: key);

  @override
  State<GuestData> createState() => _GuestDataState();
}

class _GuestDataState extends State<GuestData> {
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
                   "Guest", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0), ),
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
            child: Text('Guest Data',
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
               MaterialPageRoute(builder: (context) => SignUpGuest()));
                },
                label: 
                Text('Add Guest',
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
                DataColumn(label: Text('Username',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
                DataColumn(label: Text('Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)),
              ],
                rows: [
                DataRow(cells: [
                  DataCell(Text('1.')),
                  DataCell(Text('Jamal')),
                  DataCell(Text('jamal@gmail.com')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2.')),
                  DataCell(Text('Sebastian')),
                  DataCell(Text('admin2@gmail.com')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3.')),
                  DataCell(Text('Admin3')),
                  DataCell(Text('admin3@gmail.com')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4.')),
                  DataCell(Text('Admin4')),
                  DataCell(Text('admin4@gmail.com')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5.')),
                  DataCell(Text('Admin5')),
                  DataCell(Text('admin4@gmail.com')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6.')),
                  DataCell(Text('Admin6')),
                  DataCell(Text('admin5@gmail.com')),
                ])
              ],
            ),
          ),
        ],
      )
        );
  }
  }