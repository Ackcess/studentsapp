import 'dart:convert';

UsersPets usersPetsFromJson(String str) => UsersPets.fromJson(json.decode(str));

String usersPetsToJson(UsersPets data) => json.encode(data.toJson());

class UsersPets {
  UsersPets({
    required this.data,
  });

  final List<Datum> data;

  factory UsersPets.fromJson(Map<String, dynamic> json) => UsersPets(
        data: List<Datum>.from(json["body"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.classLevel,
    required this.isSuspended,
    required this.isMonitor
  });

  final String id;
  final String username;
  final String email;
  final String role;
  final String classLevel;
  final bool isSuspended;
  final bool isMonitor;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"].toString(),
        username: json["username"].toString(),
        email: json["email"].toString(),
        role: json["role"].toString(),
        classLevel: json["classLevel"].toString(),
        isSuspended: json["isSuspended"],
        isMonitor: json["isMonitor"]
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "role": role,
        "classLevel": classLevel,
        "isSuspended": isSuspended,
        "isMonitor": isMonitor
      };
}
