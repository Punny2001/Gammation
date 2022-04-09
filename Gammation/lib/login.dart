import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold)),
          // Container(
          //   Text("Username"),
          //   padding: EdgeInsets.only(top: 20, left: 5, right: 5),
          //   decoration: BoxDecoration(
          //       color: Color.fromRGBO(255, 238, 173, 1),
          //       borderRadius: BorderRadius.circular(29)),
          // )
        ],
      ),
    );
  }
}
