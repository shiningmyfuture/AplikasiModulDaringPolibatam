import 'package:aplikasi_modul_daring/screen/guest/dashboard_guest.dart';
import 'package:aplikasi_modul_daring/screen/mahasiswa/dashboard_mahasiswa.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import '../../Constanta/Constanta.dart';
import '../../baseApi/modul_daring_service.dart';
import '../../model/user_admin.dart';
import '../../model/user_dosen.dart';
import '../../model/user_guest.dart';
import '../../model/user_laboran.dart';
import '../../model/user_mhs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../laboran/dashboard_laboran.dart';
import 'signup_screen.dart';
import 'forgetpassword.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikasi_modul_daring/config/api.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:aplikasi_modul_daring/screen/admin/dashboard_admin.dart';
import 'package:aplikasi_modul_daring/screen/dosen/dashboard_dosen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    cekLoginMahasiswa();
    cekLoginDosen();
    cekLoginLaboran();
    cekLoginAdmin();
    cekLoginGuest();
    // TODO: implement initState
    super.initState();
  }

  void cekLoginMahasiswa() async {
    String? username =
        await storage.read(key: Constanta().keyUsernameMahasiswa);
    if (username != null) {
      if (username != "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashboardMahasiswa()),
        );
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void cekLoginDosen() async {
    String? username =
        await storage.read(key: Constanta().keyUsernameDosen);
    if (username != null) {
      if (username != "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashboardDosen()),
        );
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void cekLoginLaboran() async {
    String? username =
        await storage.read(key: Constanta().keyUsernameLaboran);
    if (username != null) {
      if (username != "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashboardLaboran()),
        );
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void cekLoginAdmin() async {
    String? username =
        await storage.read(key: Constanta().keyUsernameAdmin);
    if (username != null) {
      if (username != "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashboardAdmin()),
        );
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void cekLoginGuest() async {
    String? username =
        await storage.read(key: Constanta().keyUsernameGuest);
    if (username != null) {
      if (username != "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashboardGuest()),
        );
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  final List<String> items = [
    'Admin',
    'Lecturer',
    'Laboratory',
    'Student',
    'Guest',
  ];
  bool isLoading = true;
  String? level;
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Image.asset(
                "images/logo.png",
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 20),

            //Selamat Datang
            Text(
              'WELCOME!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            Text(
              'Polibatam Online Module App',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 25),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 0,
              ),
              child: CustomDropdownButton2(
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey[100],
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blueGrey,
                  size: 20,
                ),
                dropdownWidth: 310,
                buttonWidth: 310,
                buttonHeight: 54,
                hint: 'Select User',
                dropdownItems: items,
                value: level,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    level = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),

            //email text field
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
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.account_box_rounded,
                    color: Colors.indigoAccent,
                  ),
                  hintText: "Enter Your Username*",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            //Password Field
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blueGrey[100],
              ),
              child: TextField(
                controller: passwordController,
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

            //Forget Password field
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordPage(),
                      ));
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //Sign In Button
            InkWell(
              onTap: () async {
                if (level == "Student") {
                  await storage.write(
                      key: Constanta().keyUsernameMahasiswa,
                      value: usernameController.text);
                  Mahasiswa userMahasiswa = Mahasiswa(
                    idMhs: '',
                    username: usernameController.text,
                    password: passwordController.text,
                    nimMhs: '',
                    alamatMhs: '',
                    emailMhs: '',
                    noHpmhs: '',
                  );
                  var requestBody = jsonEncode(userMahasiswa);
                  ModulDaringAPIService()
                      .loginMhs(requestBody)
                      .then((result) async {
                    if (result != null) {
                      if (result.success) {
                        print('Login Succes Sebagai Student');
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DashboardMahasiswa()));

                        print(result.message);
                      } else {
                        print('Login Failed Sebagai Student');

                        print(result.message);
                      }
                    } else {
                      print("result is null");
                    }
                  });
                }
                if (level == "Admin") {
                  await storage.write(
                      key: Constanta().keyUsernameAdmin,
                      value: usernameController.text);
                  Admin adminModel = Admin(
                      idAdmin: '',
                      username: usernameController.text,
                      password: passwordController.text,
                      alamatAdmin: '',
                      emailAdmin: '',
                      noHpadmin: '');
                  var requestBody = jsonEncode(adminModel);
                  ModulDaringAPIService()
                      .loginAdmin(requestBody)
                      .then((result) async {
                    if (result != null) {
                      if (result.success) {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DashboardAdmin()));
                        print('Login Succes Sebagai Admin');
                        // pindah halaman

                        print(result.message);
                      } else {
                        print('Login Failed Sebagai Admin');

                        print(result.message);
                      }
                    } else {
                      print("result is null");
                    }
                  });
                }
                if (level == "Guest") {
                  await storage.write(
                      key: Constanta().keyUsernameGuest,
                      value: usernameController.text);
                  Guest userGuest = Guest(
                    idGuest: '',
                    username: usernameController.text,
                    password: passwordController.text,
                    emailGuest: '',
                  );
                  var requestBody = jsonEncode(userGuest);
                  ModulDaringAPIService()
                      .loginGuest(requestBody)
                      .then((result) async {
                    if (result != null) {
                      if (result.success) {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DashboardGuest()));
                        print('Login Succes Sebagai Guest');
                        // pindah halaman

                        print(result.message);
                      } else {
                        print('Login Failed Sebagai Guest');

                        print(result.message);
                      }
                    } else {
                      print("result is null");
                    }
                  });
                }
                if (level == "Lecturer") {
                  await storage.write(
                      key: Constanta().keyUsernameDosen,
                      value: usernameController.text);
                  Dosen userDosen = Dosen(
                    idDosen: '',
                    username: usernameController.text,
                    password: passwordController.text,
                    alamatDosen: '',
                    emailDosen: '',
                    nikDosen: '',
                    noHpdosen: '',
                  );
                  var requestBody = jsonEncode(userDosen);
                  ModulDaringAPIService()
                      .loginDosen(requestBody)
                      .then((result) async {
                    if (result != null) {
                      if (result.success) {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DashboardDosen()));
                        print('Login Success Sebagai Dosen');
                        // pindah halaman

                        print(result.message);
                      } else {
                        print('Login Failed Sebagai Dosen');

                        print(result.message);
                      }
                    } else {
                      print("result is null");
                    }
                  });
                }
                if (level == "Laboratory") {
                  await storage.write(
                      key: Constanta().keyUsernameLaboran,
                      value: usernameController.text);
                  Laboran userLaboran = Laboran(
                    idLaboran: '',
                    username: usernameController.text,
                    password: passwordController.text,
                    alamatLaboran: '',
                    emailLaboran: '',
                    nikLaboran: '',
                    noHplaboran: '',
                  );
                  var requestBody = jsonEncode(userLaboran);
                  ModulDaringAPIService()
                      .loginLaboran(requestBody)
                      .then((result) async {
                    if (result != null) {
                      if (result.success) {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DashboardLaboran()));
                        print('Login Success Sebagai Laboran');
                        // pindah halaman

                        print(result.message);
                      } else {
                        print('Login Failed Sebagai Laboran');

                        print(result.message);
                      }
                    } else {
                      print("result is null");
                    }
                  });
                }

                // if((response.statusCode == 200)&&(level == "Admin")){
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardAdmin()));
                // } else if ((response.statusCode == 200)&&(level == "Lecturer")){
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardDosen()));
                // } else if ((response.statusCode == 200)&&(level == "Laboratory")){
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardDosen()));
                // } else if ((response.statusCode == 200)&&(level == "Student")){
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardMahasiswa()));
                // } else if ((response.statusCode == 200)&&(level == "Guest")){
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardGuest()));
                // } else if ((response.statusCode == 403)||(response.statusCode == 404) ){
                //   CoolAlert.show(
                //     context: context,
                //     type: CoolAlertType.error,
                //     text: "The username or password is wrong!",
                //      );
                // } else if (usernameController.text.isEmpty || passwordController.text.isEmpty){
                //   CoolAlert.show(
                //      context: context,
                //      type: CoolAlertType.error,
                //      text: "The username and password must be filled!",
                //     );
                // } else {
                //    CoolAlert.show(
                //     context: context,
                //     type: CoolAlertType.error,
                //     text: "Try Again",
                //      );
                // }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Any Account?  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Sign Up Now",
                      style: TextStyle(
                        color: Color(0xffF5591F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                  )
                ],
              ),
            )
          ]),
        )),
      ),
    );
  }
}
