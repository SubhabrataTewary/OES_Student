import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Drawer/drawers.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class Seemarks extends StatefulWidget {
  @override
  _SeemarksState createState() => _SeemarksState();
}

class _SeemarksState extends State<Seemarks> {
  TextEditingController _subject = TextEditingController();
  TextEditingController _rollNo = TextEditingController();
  TextEditingController _sem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter Data to See your marks."),
      content: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter examination Name"),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Field Required" : null;
                },
                controller: _subject,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Enter Subject Name"),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Field Required" : null;
                },
                controller: _subject,
              ),
              SizedBox(
                height: 5,
              ),
              Text("Enter Subject code"),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Field Required" : null;
                },
                controller: _subject,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class Seemarks extends StatefulWidget {
//   @override
//   _SeemarksState createState() => _SeemarksState();
// }

// class _SeemarksState extends State<Seemarks> {
//   get marks => null;

//   // String message;

//   // void initstate() {
//   //   if (marks > 33) {
//   //     message = "passed..\n" + "you scored $marks";
//   //   } else if (marks < 33) {
//   //     message = "u can do better..\n" + "you scored $marks";
//   //   } else {
//   //     message = "u did well..\n" + "you scored $marks";
//   //   }
//   //   super.initState();
//   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     throw UnimplementedError();
// //   }
// // }

//   Widget build(BuildContext context) {
//     //   int marks;
//     //   results(
//     //     {
//     //       Key key, @required this.marks
//     //     }
//     //   ):super(key:key);
//     //   @override
//     //   _resultsState createState()=>_resultState(marks);
//     // }
//     // return ElevatedButton(
//     //   onPressed: () {
//     //     _navigateAndDisplaySelection(context);
//     //   },
//     //   child: Text('Result!'),
//     // );
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: RaisedButton(
//             onPressed: () {},
//             color: Colors.amber.shade400,
//             elevation: 3,
//             child: Text("Click Me"),
//           ),
//         ),
//       ),
//     );
//   }

// // _navigateAndDisplaySelection(BuildContext context) async {
// //   final result = await Navigator.push(
// //     context,
// //     MaterialPageRoute(builder: (context) => Results()),
// //   );
// // }
// }
