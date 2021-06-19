import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ExamPage extends StatefulWidget {
  String subName;
  String subCode;

  ExamPage({
    this.subName,
    this.subCode,
  });

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  String url =
      "https://online-examination-revised.herokuapp.com/studentapi/seekQuestion";
  @override
  void initState() {
    super.initState();
    showQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //     final list<map<sring, Object>> questions;
        //     final int questionIndex;
        // final Function answerQuestion;
        );
  }

  Future<void> showQuestion() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var response = await http.post(url, body: {
      'subjectCode': widget.subCode,
      'subjectName': widget.subName,
    }, headers: {
      'Authorization': _pref.getString('TOKEN'),
    });

    print(response.body);
  }
}
