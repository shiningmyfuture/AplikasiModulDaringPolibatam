import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_mhs.dart';

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

  Mahasiswa userMahasiswa = Mahasiswa(
      idMhs: '', 
      password: '',
      username: '', 
      alamatMhs: '', 
      emailMhs: '', 
      nimMhs: '', 
      noHpmhs: '');
  bool isLoading = true;

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  void cekUsername() async {
    String? username = await storage.read(key: Constanta().keyUsernameMahasiswa);
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
      'username': userMahasiswa.username,
      'password': passwordController.text,
      'newpassword': newpasswordController.text,
    };
    var requestBody = jsonEncode(map);
    print(requestBody);
    ModulDaringAPIService()
        .getCPMahasiswaDataByUsername(requestBody)
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

  void clearForm(){
    passwordController.clear();
    newpasswordController.clear();
    confirmPassController.clear();
  }

  void loadData() async {
    String? username = await storage.read(key: Constanta().keyUsernameMahasiswa);
    userMahasiswa.username = username!;
    var requestBody = jsonEncode(userMahasiswa);
    print(requestBody);
    ModulDaringAPIService().getMahasiswaDataByUsername(requestBody).then((result) {
      if (result.success) {
        userMahasiswa = Mahasiswa.fromJson(result.content);
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
                "Student",
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