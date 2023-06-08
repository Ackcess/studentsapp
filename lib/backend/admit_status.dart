import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdmitStatus extends StatefulWidget {
  var status;
  AdmitStatus ({Key? myKey, this.status }) : super(key: myKey);


  dynamic changeStat() async{
    print("here we admit again======================================================");
    try {
      var response = await http
          .patch(Uri.parse("http://157.245.120.161:2340/user/${12}"), body: {
        "classLevel": "false"
      });
      var dt = json.decode(response.body);

      bool auto = dt['success'] == true ? true : false;


    } catch (e) {

    }
    changeStat();
  }

  @override
  State<AdmitStatus> createState() => _ChangeState();
}

class _ChangeState extends State<AdmitStatus> {
  @override
  final status = '';

  Widget build(BuildContext context) {
    return  Placeholder();
  }
}
