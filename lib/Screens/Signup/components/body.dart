import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Drawer/drawers.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/Screens/Take_exam/attendexam.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var url =
      "https://online-examination-revised.herokuapp.com/studentapi/register";

  TextEditingController _name = TextEditingController();
  TextEditingController _roll = TextEditingController();
  TextEditingController _department = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _semester = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  final _signupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _signupKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? "Name field must not be empty"
                          : null;
                    },
                    controller: _name,
                    cursorColor: kPrimaryColor,
                    decoration: inputDecoration(Icons.person, "Name"),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? "Roll Number field must not be empty"
                          : null;
                    },
                    controller: _roll,
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: inputDecoration(null, "Roll Number"),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? "phone Number field must not be empty"
                          : null;
                    },
                    controller: _phone,
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: inputDecoration(null, "Phone Number"),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? "Email field must not be empty"
                          : null;
                    },
                    controller: _email,
                    cursorColor: kPrimaryColor,
                    decoration: inputDecoration(null, "Email"),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? "Department field must not be empty"
                          : null;
                    },
                    controller: _department,
                    cursorColor: kPrimaryColor,
                    decoration: inputDecoration(null, "Department"),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (value) {
                      return value.isEmpty
                          ? "semester field must not be empty"
                          : null;
                    },
                    controller: _semester,
                    cursorColor: kPrimaryColor,
                    decoration: inputDecoration(null, "Semester"),
                  ),
                ),
                TextFieldContainer(
                  child: TextFormField(
                    validator: (val) {
                      return val.isEmpty
                          ? "field must not be empty"
                          : val.length <= 7
                              ? "password must be 8 character long"
                              : null;
                    },
                    controller: _password,
                    obscureText: true,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                RoundedButton(
                  text: "SIGNUP",
                  press: () {
                    if (_signupKey.currentState.validate()) {
                      signUp();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Drawers();
                          },
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: size.height * 0.02),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SocalIcon(
                    // iconSrc: "assets/icons/twitter.svg",
                    // press: () {},
                    // ),
                    SocalIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(IconData icon, String hintText) {
    return InputDecoration(
      icon: Icon(
        icon,
        color: kPrimaryColor,
      ),
      hintText: hintText,
      border: InputBorder.none,
    );
  }

  Future signUp() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var req = await http.post(url, body: {
      "name": _name.text,
      "phone": _phone.text,
      "email": _email.text,
      "roll": _roll.text,
      "sem": _semester.text,
      "dept": _department.text,
      "password": _password.text,
    });
    print(req.body);
    if (req.statusCode == 200) {
      // Navigator.of(context).pushReplacementNamed(routeName)
      var res = convert.jsonDecode(req.body);
      setState(() {
        _prefs.setString('NAME', _name.text);
        _prefs.setString('ROLL_NO', _roll.text);
        _prefs.setString('EMAIL', _email.text);
        _prefs.setString('PHONE', _phone.text);
        _prefs.setString('DEPT', _department.text);
        _prefs.setString('TOKEN', res["token"]);
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ExamPage();
        }),
      );
    }

    _name.clear();
    _phone.clear();
    _email.clear();
    _roll.clear();
    _department.clear();
    _semester.clear();
    _password.clear();
  }
}
