import 'dart:convert';

import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_dosen.dart';
import '../../model/user_laboran.dart';
import 'my_course.dart';
import 'manage.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:aplikasi_modul_daring/screen/login/login.dart';

class DashboardLaboran extends StatefulWidget {
  const DashboardLaboran({Key? key}) : super(key: key);

  @override
  State<DashboardLaboran> createState() => _DashboardLaboranState();
}

class _DashboardLaboranState extends State<DashboardLaboran> {
  final storage = FlutterSecureStorage();
  bool isLoading = true;

  Laboran laboran = Laboran(
      alamatLaboran: '',
      emailLaboran: '',
      idLaboran: '',
      nikLaboran: '',
      noHplaboran: '',
      password: '',
      username: '');
  
  @override

  
    void initState() {
      // TODO: implement initState
      loadDataLaboran();

      super.initState();
    }

    void loadDataLaboran() async{
      String? username = await storage.read(key: Constanta().keyUsernameLaboran);
    laboran.username = username!;
    var requestBody = jsonEncode(laboran);
    ModulDaringAPIService().getLaboranDataByUsername(requestBody).then((result) {
      setState(() {
        isLoading = true;
      });
      if (result.success) {
        laboran = Laboran.fromJson(result.content);
        // loadDataLaboran();
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
    final userId;
    final userData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(width: 10.0, height: 50.0),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                laboran.username,
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
      drawer: SideBar(),
      body: ListView(
        children: <Widget>[
          _top(),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu",
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
                          MaterialPageRoute(builder: (context) => MyCourse()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.book,
                            size: 70,
                            color: Colors.indigoAccent,
                          ),
                          Text("My Course",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
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
                              builder: (context) => MyHomePage()));
                    },
                    splashColor: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.bookmark_add,
                            size: 70,
                            color: Colors.indigoAccent,
                          ),
                          Text("Manage Course",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
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

  _top() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent[400],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10.0, height: 50.0),
              Text(
                "Dashboard",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10.0, height: 10.0),
              Text(
                "Hi, "+laboran.username,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ],
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text("Laboran1@gmail.com"),
            accountName: Text("Laboran1"),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.white),
            decoration: new BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardLaboran()));
            },
          ),
          ListTile(
              leading: Icon(Icons.book_online),
              title: Text("My Course"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCourse()));
              }),
          ListTile(
              leading: Icon(Icons.book_online),
              title: Text("Manage Course"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }),
          ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text("Change Password"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePass()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () async {
              await storage.delete(key: Constanta().keyUsernameLaboran);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final storage = FlutterSecureStorage();
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final newpasswordController = TextEditingController();
  final confirmPassController = TextEditingController();

  Laboran userLaboran = Laboran(
      alamatLaboran: '',
      emailLaboran: '',
      idLaboran: '',
      nikLaboran: '',
      password: '',
      username: '',
      noHplaboran: '');
  bool isLoading = true;

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  void cekUsername() async {
    String? username = await storage.read(key: Constanta().keyUsernameLaboran);
    if (username != null) {
      if (username != '') {
        changePassword();
      } else {
        print('Old Password is Wrong');
      }
    } else {
      print('User Not Found');
    }
  }

  void changePassword() async {
    Map map = {
      'username': userLaboran.username,
      'password': passwordController.text,
      'newpassword': newpasswordController.text,
    };
    var requestBody = jsonEncode(map);
    print(requestBody);
    ModulDaringAPIService()
        .getCPLaboranDataByUsername(requestBody)
        .then((result) {
      if (result.success) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Change password is success!",
          onConfirmBtnTap: () {
            Navigator.of(context).pop();
            clearForm();
          },
        );
        print('Change password success');
      } else {
        print('Change password failed');
        print(result.message);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  void clearForm() {
    passwordController.clear();
    newpasswordController.clear();
    confirmPassController.clear();
  }

  void loadData() async {
    String? username = await storage.read(key: Constanta().keyUsernameLaboran);
    userLaboran.username = username!;
    var requestBody = jsonEncode(userLaboran);
    print(requestBody);
    ModulDaringAPIService()
        .getLaboranDataByUsername(requestBody)
        .then((result) {
      if (result.success) {
        userLaboran = Laboran.fromJson(result.content);
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 90,
                      color: Colors.indigoAccent,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Old Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty!";
                    }
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter old password*',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'New Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty!";
                    }
                  },
                  controller: newpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter new password*',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Confirm New Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty!";
                    } else if (value != newpasswordController.text) {
                      return "Your password not match!";
                    }
                  },
                  controller: confirmPassController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey[50],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Confirm new password*',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 95,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cekUsername();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 95,
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
