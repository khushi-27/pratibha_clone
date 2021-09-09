import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  UserLoginModel({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.token,
    required this.message,
  });

  String id;
  String token;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        token: json["Token"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Token": token,
        "Message": message,
      };
}
