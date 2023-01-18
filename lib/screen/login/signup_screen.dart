import 'signup_dosen.dart';
import 'signup_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'signup_guest.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 10,
                right: 10,
                top: 10,
              ),
              margin: EdgeInsets.fromLTRB(60, 20, 60, 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue[400]),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpDosen()));
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        FontAwesomeIcons.chalkboardTeacher,
                        size: 70,
                      ),
                      Text("Dosen",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 10,
                right: 10,
                top: 10,
              ),
              margin: EdgeInsets.fromLTRB(60, 20, 60, 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green[400]),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpMahasiswa()));
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        FontAwesomeIcons.userGraduate,
                        size: 70,
                      ),
                      // Icon(
                      //   Icons.person,
                      //   size: 70,
                      //   color: Colors.black,
                      // ),
                      Text("Mahasiswa",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 10,
                right: 10,
                top: 10,
              ),
              margin: EdgeInsets.fromLTRB(60, 20, 60, 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.pink[200]),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpGuest()));
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        FontAwesomeIcons.users,
                        size: 70,
                      ),
                      Text("Guest",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
