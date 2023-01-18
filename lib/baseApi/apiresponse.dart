import 'dart:convert';

ApiResponseModel apiResponseModelFromJson(String str) => ApiResponseModel.fromJson(json.decode(str));

String apiResponseModelToJson(ApiResponseModel data) => json.encode(data.toJson());

class ApiResponseModel {
  ApiResponseModel({
    required this.success,
    required this.message,
    required this.code,
    required this.content,
  });

  bool success;
  String message;
  int code;
  dynamic content;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
        success: json["success"],
        message: json["message"],
        code: json["code"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "content": content,
      };
}
