import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './signup.dart';

// import 'Signup.dart';
import 'description.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  Future login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress.text,
          password: password.text
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return MyApp();
        }),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      showDialog(context: context, builder: (context) => AlertDialog(title: Text("Login Fail!!!"),
        content: Text(e.message.toString()),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"))],));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      appBar: AppBar(
        title: Text("Gammation", style: TextStyle(color: Colors.black, fontSize: 30),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 238, 173, 1),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign In", style: TextStyle(fontSize: 30),),
          SizedBox(
            child: Form(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left:30, right:30, top:50, bottom: 30),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(controller: emailAddress,
                      decoration: InputDecoration(label: Text("Username")),),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    TextField(controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        // suffixIcon: Icon(
                        //     Icons.visibility
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 238, 173, 1),
                    onPrimary: Colors.black,
                  ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignupScreen();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              SizedBox(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 238, 173, 1),
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    login();
                  },
                  icon: Icon(Icons.login),
                  label: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
