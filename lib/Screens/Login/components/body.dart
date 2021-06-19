import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Drawer/drawers.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import '../../../constants.dart';

//  Global Variable for Storing Field Values

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var url = "https://online-examination-revised.herokuapp.com/studentapi/login";

  final _loginKey = GlobalKey<FormState>();

  // TextEditingController _phone = TextEditingController();
  TextEditingController _passwd = TextEditingController();
  TextEditingController _roll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              // TextFieldContainer(
              //   child: TextFormField(
              //     validator: (value) {
              //       return value.isEmpty
              //           ? "phone Number field must not be empty"
              //           : null;
              //     },
              //     controller: _phone,
              //     keyboardType: TextInputType.number,
              //     obscureText: true,
              //     cursorColor: kPrimaryColor,
              //     decoration: inputDecoration(null, "Phone Number"),
              //   ),
              // ),
              TextFieldContainer(
                child: TextFormField(
                  validator: (value) {
                    return value.isEmpty
                        ? "roll Number field must not be empty"
                        : null;
                  },
                  controller: _roll,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: inputDecoration(null, "roll Number"),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  validator: (value) {
                    return value.isEmpty
                        ? "Password field must not be empty"
                        : null;
                  },
                  controller: _passwd,
                  cursorColor: kPrimaryColor,
                  decoration: inputDecoration(null, "Password"),
                ),
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  if (_loginKey.currentState.validate()) {
                    login();
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
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
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

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var req = await http.post(url, body: {
      // "phone": _phone.text,
      "rollno": _roll.text,
      "password": _passwd.text,
    });

    // print(req.body);
    var res = convert.jsonDecode(req.body);
    if (req.statusCode == 200) {
      prefs.setString("ROLLNO", _roll.text);
      prefs.setString("TOKEN", res["token"]);
    } else {
      print(res["errors"]);
    }
  }
}
