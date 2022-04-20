import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gammation/main.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      width: double.infinity,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),),
          Text('Report an issue', style: TextStyle(fontSize: 20), textAlign: TextAlign.left,),
          TextField(
            decoration: InputDecoration()
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: SizedBox(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 238, 173, 1),
                  onPrimary: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MyApp();
                      }
                      )
                  );
                },
                label: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),
                icon: Icon(Icons.send),
              ),
            ),
          ),
        ],

      ),
    );
  }
}