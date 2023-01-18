import 'package:flutter/material.dart';
import 'modul.dart';

class PDFmodul extends StatefulWidget {
  const PDFmodul({Key? key}) : super(key: key);

  @override
  State<PDFmodul> createState() => _PDFmodulState();
}

class _PDFmodulState extends State<PDFmodul> {
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
                  "PDF Modul",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              bottom: 50,
              right: 10,
              top: 50,
            ),
            margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blueGrey[100]),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.picture_as_pdf,
                      size: 120,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.redAccent),
            child: InkWell(
              onTap: () {
                Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => AddQuiz()));
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "ADD QUIZ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
     ),
);
}
}