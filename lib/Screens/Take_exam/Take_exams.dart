import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Drawer/drawers.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Take_exam/attendexam.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Takeexams extends StatefulWidget {
  @override
  _TakeexamsState createState() => _TakeexamsState();
}

class _TakeexamsState extends State<Takeexams> {
  var url =
      "https://online-examination-revised.herokuapp.com/studentapi/takeExam";
  // TextEditingController _name = TextEditingController();
  // TextEditingController _roll = TextEditingController();
  // TextEditingController _dept = TextEditingController();
  TextEditingController _subname = TextEditingController();
  // TextEditingController _sem = TextEditingController();
  TextEditingController _subcode = TextEditingController();
  // TextEditingController _exname = TextEditingController();

  final _examFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Background(
          child: SingleChildScrollView(
            child: Form(
              key: _examFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // TextFieldContainer(
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       return value.isEmpty
                  //           ? "name field must not be empty"
                  //           : null;
                  //     },
                  //     controller: _name,
                  //     cursorColor: kPrimaryColor,
                  //     decoration: inputDecoration(Icons.person, "Name"),
                  //   ),
                  // ),
                  // TextFieldContainer(
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       return value.isEmpty
                  //           ? "roll field must not be empty"
                  //           : null;
                  //     },
                  //     // onChanged: (val) {
                  //     //   _roll = val as TextEditingController;
                  //     //   print(_roll);
                  //     // },
                  //     // onSaved: (val) {
                  //     //   _roll = val as TextEditingController;
                  //     //   print(_roll);
                  //     // },
                  //     controller: _roll,
                  //     cursorColor: kPrimaryColor,
                  //     decoration: inputDecoration(null, "roll Number"),
                  //   ),
                  // ),
                  // TextFieldContainer(
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       return value.isEmpty
                  //           ? "sem field must not be empty"
                  //           : null;
                  //     },
                  //     controller: _sem,
                  //     cursorColor: kPrimaryColor,
                  //     decoration: inputDecoration(null, "sem"),
                  //   ),
                  // ),
                  // TextFieldContainer(
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       return value.isEmpty
                  //           ? "department field must not be empty"
                  //           : null;
                  //     },
                  //     controller: _dept,
                  //     cursorColor: kPrimaryColor,
                  //     decoration: inputDecoration(null, "department"),
                  //   ),
                  // ),
                  // TextFieldContainer(
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       return value.isEmpty
                  //           ? "examinationName field must not be empty"
                  //           : null;
                  //     },
                  //     controller: _exname,
                  //     cursorColor: kPrimaryColor,
                  //     decoration: inputDecoration(null, "examination name"),
                  //   ),
                  // ),
                  TextFieldContainer(
                    child: TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "sub name field must not be empty"
                            : null;
                      },
                      controller: _subname,
                      cursorColor: kPrimaryColor,
                      decoration: inputDecoration(null, "sub name"),
                    ),
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      validator: (value) {
                        return value.isEmpty
                            ? "sub code field must not be empty"
                            : null;
                      },
                      controller: _subcode,
                      cursorColor: kPrimaryColor,
                      decoration: inputDecoration(null, "sub code"),
                    ),
                  ),
                  RoundedButton(
                    text: "SUBMIT",
                    press: () {
                      if (_examFormKey.currentState.validate()) {
                        Navigator.pushReplacementNamed(context, '/giveExam',
                            arguments: {
                              _subcode.text,
                              _subname.text,
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(IconData person, String s) {
    return InputDecoration(
      hintText: s,
      border: InputBorder.none,
    );
  }
}
