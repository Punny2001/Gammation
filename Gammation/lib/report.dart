import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        ],
      ),
    );
  }
}