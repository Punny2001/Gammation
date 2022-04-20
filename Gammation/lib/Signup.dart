import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'model/profile.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var emailAddress = TextEditingController();
  var password = TextEditingController();

  Future register() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress.text,
        password: password.text,
      );
      Navigator.push(context,
        MaterialPageRoute(builder: (context) {
        return LoginPage();
      }),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      showDialog(context: context, builder: (context) => AlertDialog(title: Text("Login Fail!!!"),
        content: Text(e.message.toString()),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"))],));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      appBar: AppBar(
        title: Text("Registration", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(255, 238, 173, 1),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(controller: emailAddress, decoration: InputDecoration(label: Text("Username")),),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  TextField(controller: password, decoration: InputDecoration(label: Text("Password")),),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Center(
                    child: SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 238, 173, 1),
                          onPrimary: Colors.black,
                        ),
                        child: Text("Register", style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          register();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
