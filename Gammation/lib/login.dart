import 'package:flutter/material.dart';
import 'package:gammation/home.dart';

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
        title: Text("Gammation"),
        backgroundColor: Color.fromRGBO(255, 238, 173, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
              child: Form(
                  child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Username", style: TextStyle(fontSize: 20)),
                TextFormField(),
                Text("Password", style: TextStyle(fontSize: 20)),
                TextFormField(obscureText: true),
              ],
            ),
          ))),
          SizedBox(
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
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
