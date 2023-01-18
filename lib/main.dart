import 'package:aplikasi_modul_daring/screen/mahasiswa/pilih_matkul.dart';
import 'package:aplikasi_modul_daring/screen/test_dropdown.dart';
import 'package:flutter/material.dart';
import 'screen/admin/dashboard_admin.dart';
import 'screen/login/splashscreen.dart';
import 'screen/mahasiswa/choose_jurusan.dart';
import 'screen/mahasiswa/enroll_course.dart';
import 'package:aplikasi_modul_daring/screen/login/signup_mahasiswa.dart';
import 'package:aplikasi_modul_daring/screen/mahasiswa/choose_course.dart';
import 'package:aplikasi_modul_daring/screen/mahasiswa/choose_course.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: ChooseJurusan(),
      // home: ChooseCourse(),
      // home: ChooseCourseTest(),
      // home: EnrollCourse(),
    // home: EnrollMyCourse(),
    // home: SignUpMahasiswa(),
    );
  }

}