import 'package:flutter/material.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_admin.dart';
import '../../model/user_mhs.dart';
import '../login/login.dart';
// import 'package:aplikasi_modul_daring/screen/admin/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:aplikasi_modul_daring/config/api.dart';
import 'package:aplikasi_modul_daring/screen/Admin/dashboard_Admin.dart';

class SignUpAdmin extends StatefulWidget {
  const SignUpAdmin({Key? key}) : super(key: key);
  @override
  State<SignUpAdmin> createState() => _SignUpAdminState();
}

class _SignUpAdminState extends State<SignUpAdmin> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController pass_ok = TextEditingController();
  final TextEditingController no_hpadmin = TextEditingController();
  final TextEditingController email_admin = TextEditingController();
  final TextEditingController alamat_admin = TextEditingController();

  // String baseUrl = api.register;

  // insertApi() async {
  //   try {
  //                  var data = {
  //                 'username': _username,
  //                 'password': _password,
  //                 'nim_mhs': nim_mhs,
  //                 'no_hpmhs': no_hpmhs,
  //                 'email_mhs': email_mhs,
  //                 'alamat_mhs': alamat_mhs,
  //               };

  //               final String jsonString = jsonEncode(data);
  //               var response = await http.post(
  //                 Uri.parse(baseUrl),
  //                 body:  jsonString
  //               );

  //               print(jsonString);

  //               _username.clear();
  //               _password.clear();
  //               nim_mhs.clear();
  //               no_hpmhs.clear();
  //               email_mhs.clear();
  //               alamat_mhs.clear();

  //               if (response.statusCode == 200){
  //                 CoolAlert.show(
  //                   context: context,
  //                   type: CoolAlertType.success,
  //                   text: "Account success to created",
  //                 );
  //               } else if (data.isEmpty){
  //                 CoolAlert.show(
  //                   context: context,
  //                   type: CoolAlertType.warning,
  //                   text: "Fill your data correctly!"
  //                 );

  //               } else{
  //                 CoolAlert.show(
  //                   context: context,
  //                   type: CoolAlertType.error,
  //                   text: "Error",
  //                 );
  //               }

  //               print('Response status: ${response.statusCode}');
  //               print('Response body: ${response.body}');
  // }  catch (e) {
  //                 print(e.toString());
  // }

  // }

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
                   "Add Admin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0), ),
               ),
             ),
             
        ],
        elevation: 0,
        backgroundColor: Colors.blueAccent[400],
      ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Form(
          key: formKey,

          child: ListView(
            children: [
              Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 20, top: 50, bottom: 40, left: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "ADD DATA ADMIN",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                )),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 0,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey[100],
                ),
                child: TextFormField(
                  validator: (value){
                    if (value==null||value.isEmpty){
                      return "Username cannot be empty!";
                    }
                  },
                  controller: _username,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.indigoAccent,
                    ),
                    hintText: "Enter Username*",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey[100],
                ),
                child: TextFormField(
                  validator: (value){
                    if (value==null||value.isEmpty){
                      return "Email cannot be empty!";
                    }
                  },
                  controller: email_admin,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.indigoAccent,
                    ),
                    hintText: "Enter Email*",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey[100],
                ),
                child: TextFormField(
                  validator: (value){
                    if (value==null||value.isEmpty){
                      return "Phone Number cannot be empty!";
                    }
                  },
                  controller: no_hpadmin,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.indigoAccent,
                    ),
                    hintText: "Enter Your Phone Number*",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey[100],
                ),
                child: TextFormField(
                  validator: (value){
                    if (value==null||value.isEmpty){
                      return "Password cannot be empty!";
                    }
                  },
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.indigoAccent,
                    ),
                    hintText: "Enter Your Password*",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey[100],
                ),
                child: TextFormField(
                  obscureText: true,
                  validator: (value){
                    if (value==null||value.isEmpty){
                      return "Password cannot be empty!";
                    } else if (value != _password.text){
                      return "Your password not match!";
                    }
                  },
                  controller: pass_ok,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.indigoAccent,
                    ),
                    hintText: "Confirm Your Password*",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // insertApi();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      (new Color(0xFF304FFE)),
                      new Color(0xFF304FFE)
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()){
                        Admin userAdmin = Admin(
                        idAdmin: '', 
                        alamatAdmin: alamat_admin.text, 
                        emailAdmin: email_admin.text, 
                        noHpadmin: no_hpadmin.text, 
                        password: _password.text, 
                        username: _username.text,
                      );
                      var requestBody = jsonEncode(userAdmin);
                      ModulDaringAPIService()
                          .insertAdminData(requestBody)
                          .then((result) {
                        if (result != null) {
                          if (result.success) {
                            // pindah halaman

                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: "Account success to created!",
                              onConfirmBtnTap: () {
                                _username.clear();
                                _password.clear();
                                pass_ok.clear();
                                email_admin.clear();
                                 Navigator.of(context).pop();
                                 
                              },
                            );

                            // successCreateAccount(context);

                            print(result.message);
                          } else {
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.warning,
                              text: "Data is already exist!",
                              onConfirmBtnTap: () {
                                _username.clear();
                                _password.clear();
                                email_admin.clear();
                                pass_ok.clear();
                                Navigator.of(context).pop();
                              },
                            );

                            print(result.message);
                            // failedCreateAccount(context);
                          }
                        } else {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: "Failed to Sign Up",
                          );
                          print("Result is null");
                        }
                      });
                      }
                      
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        )));
  }
}
