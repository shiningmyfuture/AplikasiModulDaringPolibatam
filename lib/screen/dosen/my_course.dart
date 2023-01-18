import 'package:flutter/material.dart';
import 'modul.dart';

class MyCourse extends StatefulWidget {
  const MyCourse ({Key? key}) : super(key: key);

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
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
       body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Course",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
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
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => ModulDosen()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const<Widget>[
                          Icon(Icons.data_object_sharp, size: 70, color: Colors.indigoAccent,),
                          Text("Basis Data", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold,), textAlign: TextAlign.center),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => ModulDosen()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const<Widget>[
                          Icon(Icons.apps, size: 60, color: Colors.indigoAccent,),
                          Text("Rekayasa Perangkat Lunak", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => ModulDosen()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const<Widget>[
                          Icon(Icons.web, size: 70, color: Colors.indigoAccent,),
                          Text("Pemrograman Web", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => ModulDosen()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const<Widget>[
                          Icon(Icons.web_asset, size: 70, color: Colors.indigoAccent,),
                          Text("Dasar Pemrograman", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => ModulDosen()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const<Widget>[
                          Icon(Icons.book_online, size: 70, color: Colors.indigoAccent,),
                          Text("Bahasa \n Indonesia", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
    ),
        );
  }
  }