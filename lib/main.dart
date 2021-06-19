import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Drawer/drawers.dart';
import 'package:flutter_auth/Screens/Take_exam/attendexam.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/constants.dart';

import 'Screens/Signup/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var name = _prefs.getString('NAME');
  var rollno = _prefs.getString('ROLL_NO');
  var email = _prefs.getString('EMAIL');
  var phone = _prefs.getString('PHONE');
  var dept = _prefs.getString('DEPT');
  var token = _prefs.getString('TOKEN');
  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String token;
  MyApp({this.token});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      routes: <String, WidgetBuilder>{
        '/giveExam': (BuildContext context) => ExamPage(),
      },
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: token == null ? WelcomeScreen() : Drawers(),
    );
  }
}
