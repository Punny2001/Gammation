import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class userprofilePage extends StatefulWidget {
  const userprofilePage({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;
  @override
  _userprofilePage createState() => _userprofilePage();
}

class _userprofilePage extends State<userprofilePage>{
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("User Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(255, 238, 173, 1),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          SizedBox(height: 80,),
          Container(
            alignment:  Alignment.center,
            child: (
                Text(widget.userEmail,
                style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w800),)
            ),
          ),
          SizedBox(height: 50,),
          Container(
            padding: EdgeInsets.only(left: 100, right: 100),
            child: SizedBox(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(253, 94, 100, 1.0),
                  onPrimary: Colors.black,
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.logout),
                label: Text(
                  "Log out",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildTop(){
    final bottom = profileHeight/2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],

    );
  }
  Widget buildCoverImage() => Container(
    color: Color.fromRGBO(255, 238, 173, 1),
    width: double.infinity,
    height: coverHeight,
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight/2,
    backgroundColor: Color.fromRGBO(158, 214, 188, 1),
    backgroundImage: NetworkImage(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEH6tEooi7t25bGaYJc9PYKrPBpwPjOy_nrXKHDrgeLgkoC-ZkfpI3MgcUjiL3ueZZKXA&usqp=CAU'
    ),
  );
}