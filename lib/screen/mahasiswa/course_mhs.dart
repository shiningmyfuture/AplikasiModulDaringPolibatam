import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_mhs.dart';
import 'modul_mhs.dart';

class MyCourseMhs extends StatefulWidget {
  const MyCourseMhs({Key? key}) : super(key: key);

  @override
  State<MyCourseMhs> createState() => _MyCourseMhsState();
}

class _MyCourseMhsState extends State<MyCourseMhs> {
  final storage = FlutterSecureStorage();
  bool isLoading = false;

  Mahasiswa mahasiswa = Mahasiswa(
      alamatMhs: '',
      emailMhs: '',
      idMhs: '',
      nimMhs: '',
      noHpmhs: '',
      password: '',
      username: '');

  @override
  void initState() {
    // TODO: implement initState
    loadDataMahasiswa();

    super.initState();
  }

  void loadDataMahasiswa() async {
    String? username =
        await storage.read(key: Constanta().keyUsernameMahasiswa);
    mahasiswa.username = username!;
    var requestBody = jsonEncode(mahasiswa);
    ModulDaringAPIService()
        .getMahasiswaDataByUsername(requestBody)
        .then((result) {
      setState(() {
        isLoading = true;
      });
      if (result.success) {
        mahasiswa = Mahasiswa.fromJson(result.content);
        // loadDataMahasiswa();
      } else {
        print(result.message);
      }
      setState(() {
        isLoading = true;
      });
    });
  }

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
                mahasiswa.username,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Course",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
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
                          MaterialPageRoute(builder: (context) => Modulmhs()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Modulmhs()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Modulmhs()));
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
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Modulmhs()));
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
                                fontSize: 17.0, fontWeight: FontWeight.bold),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Modulmhs()));
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
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
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
