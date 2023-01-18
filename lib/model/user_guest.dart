// To parse this JSON data, do
//
//     final guest = guestFromJson(jsonString);

import 'dart:convert';

Guest guestFromJson(String str) => Guest.fromJson(json.decode(str));

String guestToJson(Guest data) => json.encode(data.toJson());

class Guest {
    Guest({
      required this.idGuest,
      required this.username,
      required this.password,
      required this.emailGuest,
    });

    String idGuest;
    String username;
    String password;
    String emailGuest;

    factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        idGuest: json["id_guest"],
        username: json["username"],
        password: json["password"],
        emailGuest: json["email_guest"],
    );

    Map<String, dynamic> toJson() => {
        "id_guest": idGuest,
        "username": username,
        "password": password,
        "email_guest": emailGuest,
    };
}
