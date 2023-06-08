import 'dart:convert';
import 'package:http/http.dart' as http;
import 'preferences.dart';

Future<List?> LoginCredentials(
    {required String email, required String pwd}) async {
  try {
    var response = await http
        .post(Uri.parse("http://157.245.120.161:2340/user/login"), body: {
      "email": email,
      "password": pwd,
    });
    var dt = json.decode(response.body);
    var dat = dt['body'];
    var usr = dat['user'];

    bool auto = dt['success'] == true ? true : false;

    String usremail = usr["email"].toString();
    String usrname = usr["username"].toString();
    String usrrole = usr["role"].toString();
    String userSuspend = usr["classLevel"].toString();
    bool userMonitor = usr["isMonitor"];

    if (userSuspend=="Suspended") {
      return  ["","","",false,"",false];
    }


    if (auto) {
      var dt2 = dt['body'];
      var dt3 = dt2['user'];
      String role = dt3['role'];
      simplePreferences.setAllowed();
      simplePreferences.setEmail(email: email);
      simplePreferences.setRole(role: role);
      return [usrname,usremail,usrrole,userMonitor,userSuspend,true];
    }
    else{
      return  ["","","",false,"",false];
    }
  } catch (e) {
     // rethrow;
    return ["","","",false,"",false];
   }
}

Future<List?> signUpCredentials(
    {required String email,
    required String pwd,
    required String name
  }) async {
  try {
    var response = await http
        .post(Uri.parse("http://157.245.120.161:2340/user/register"), body: {
      "email": email,
      "password": pwd,
      "role": "Student",
      "username": name,
      "classLevel": "Active"
    });
    var dt = json.decode(response.body);
    var dat = dt['body'];
    var usr = dat['role'];

    String usremail = dat["email"].toString();
    String usrname = dat["username"].toString();
    String usrrole = dat["role"].toString();
    String userSuspend = usr["classLevel"];;
    bool userMonitor = dat["isMonitor"];

    bool auto = dt['success'] == true ? true : false;
    // return [dt];


    if (auto) {
      simplePreferences.setAllowed();
      simplePreferences.setEmail(email: email);
      simplePreferences.setRole(role: "Student");
      simplePreferences.setName(name: name);
      return [usrname,usremail,usrrole,userMonitor,userSuspend,true];;
    }
    else{
      return  ["","","",false,"",false];
    }

  } catch (e) {
    return ["","","",false,"",false];
    // rethrow;
  }
}



Future<bool?> changeStateSuspend(
    {required String id,
    }) async {
  try {
    var response = await http
        .patch(Uri.parse("http://157.245.120.161:2340/user/$id"), body: {
      "classLevel": "Suspended",
      // "isSuspended":true
    });
    var dt = json.decode(response.body);

    bool auto = dt['success'] == true ? true : false;

    if (auto==true){
      return true;
    }
    else{
      return false;
    }


  } catch (e) {
    return false;
  }

}

Future<bool?> changeStateAdmit(
    {required String id,
    }) async {
  try {
    var response = await http
        .patch(Uri.parse("http://157.245.120.161:2340/user/$id"), body: {
      "classLevel": "Active",
      // "isSuspended":false
    });
    var dt = json.decode(response.body);

    bool auto = dt['success'] == true ? true : false;
    if (auto==true){
      return true;
    }
    else{
      return false;
    }


  } catch (e) {
    return false;
  }
  return null;
}



Future<bool?> removeAdmin(
    {required String id,
    }) async {
  try {
    var response = await http
        .patch(Uri.parse("http://157.245.120.161:2340/user/$id"), body: {
      "isMonitor": "false"
    });

    var dt = json.decode(response.body);

    bool auto = dt['success'] == true ? true : false;

    if (auto==true){
      return true;
    }
    else{
      return false;
    }


  } catch (e) {
    rethrow;
  }

}


Future<bool?> makeAdmin(
    {required String id,
    }) async {
  try {
    var response = await http
        .patch(Uri.parse("http://157.245.120.161:2340/user/$id"), body: {
             "isMonitor": "true"
         });

    var dt = json.decode(response.body);

    bool auto = dt['success'] == true ? true : false;

    if (auto==true){
      return true;
    }
    else{
      return false;
    }


  } catch (e) {
    rethrow;
  }

}

