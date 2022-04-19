import 'package:flutter/material.dart';

import 'login.dart';
import 'model/profile.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  Text("Password", style: TextStyle(fontSize: 20)),
                  TextFormField(obscureText: true),
                  Text("Firstname", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  Text("Lastname", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  Text("Address", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  Text("Province", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  Text("Country", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                  SizedBox(
                    child: ElevatedButton(
                      child: Text("Register", style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        LoginPage();
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
