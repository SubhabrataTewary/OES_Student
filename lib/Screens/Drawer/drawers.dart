import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Take_exam/Take_exams.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/result/see_marks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  var url =
      "https://online-examination-revised.herokuapp.com/studentapi/update";

  bool _isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OES"),
      ),
      body: Container(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.lightBlue.shade50,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 50, bottom: 50, right: 150),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: TextField(
                keyboardType: TextInputType.number,
                enabled: _isEnabled,
                decoration: InputDecoration(
                  hintText: 'Enter phno',
                ),
              ),
              subtitle: Text("phone"),
              trailing: Icon(Icons.edit),
              onTap: () {
                setState(() {
                  _isEnabled = !_isEnabled;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: TextField(
                keyboardType: TextInputType.emailAddress,
                enabled: _isEnabled,
                decoration: InputDecoration(hintText: 'enter email'),
              ),
              subtitle: Text("s@gmail.com"),
              trailing: Icon(Icons.edit),
              onTap: () {
                setState(() {
                  _isEnabled = !_isEnabled;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                child: Text('EXAM PREVIEW'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue.shade600,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                child: Text("TAKE EXAM"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Takeexams();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue.shade600,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                child: Text("SUB_RESULT"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Seemarks();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue.shade600,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                child: Text("SEE_MARKS"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Seemarks();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue.shade600,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ElevatedButton(
                child: Text("LOGOUT"),
                onPressed: () {
                  clearSharedPrefs();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return WelcomeScreen();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.blue.shade600,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> clearSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("NAME");
    prefs.remove("ROLL_NO");
    prefs.remove("EMAIL");
    prefs.remove("PHONE");
    prefs.remove("DEPT");
    prefs.remove("TOKEN");
  }
}
