

class Body {

  String? username;
  String? classLevel;
  String? role;

  Body(
      {
      this.username,   
      this.classLevel,
      this.role,});

  Body.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    classLevel = json['classLevel'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['classLevel'] = classLevel;
    data['role'] = role;
    return data;
  }
}