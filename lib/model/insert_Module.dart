// To parse this JSON data, do
//
//     final insertModule = insertModuleFromJson(jsonString);

import 'dart:convert';

InsertModule insertModuleFromJson(String str) => InsertModule.fromJson(json.decode(str));

String insertModuleToJson(InsertModule data) => json.encode(data.toJson());

class InsertModule {
    InsertModule({
        required this.idCourse,
        required this.moduleType,
        required this.courseTitle,
        required this.courseDesc,
        required this.courseLink,
        required this.iconLink,
    });

    String idCourse;
    String moduleType;
    String courseTitle;
    String courseDesc;
    String courseLink;
    String iconLink;

    factory InsertModule.fromJson(Map<String, dynamic> json) => InsertModule(
        idCourse: json["id_course"],
        moduleType: json["module_type"],
        courseTitle: json["course_title"],
        courseDesc: json["course_desc"],
        courseLink: json["course_link"],
        iconLink: json["icon_link"],
    );

    Map<String, dynamic> toJson() => {
        "id_course": idCourse,
        "module_type": moduleType,
        "course_title": courseTitle,
        "course_desc": courseDesc,
        "course_link": courseLink,
        "icon_link": iconLink,
    };
}
