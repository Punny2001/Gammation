import 'package:flutter/material.dart';
import './signup.dart';

// import 'Signup.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        children: [
          SizedBox(
            child: Form(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left:30, right:30, top:50, bottom: 30),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username", style: TextStyle(fontSize: 20)),
                    TextFormField(),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Text("Password", style: TextStyle(fontSize: 20)),
                    TextFormField(obscureText: true),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: ElevatedButton.icon(
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MyApp();
                  }),
                );
              },
              icon: Icon(Icons.login),
              label: Text(
                "Sign in",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
