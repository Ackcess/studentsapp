import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangeStatus extends StatefulWidget {
  var status;
  ChangeStatus ({Key? myKey, this.status }) : super(key: myKey);

  @override
  State<ChangeStatus> createState() => _ChangeState();
}

class _ChangeState extends State<ChangeStatus> {
  @override
  final status = '';

  void changeStat() async{
    print("we suspend");
    try {

      var response = await http
          .patch(Uri.parse("http://157.245.120.161:2340/user/${12}"), body: {
        "classLevel": "true"
      });
      var dt = json.decode(response.body);

      bool auto = dt['success'] == true ? true : false;


    } catch (e) {

    }
  }
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
