import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key, required this.imageURL, required this.gameName, required this.gameDescription}) : super(key: key);
  final String imageURL;
  final String gameName;
  final String gameDescription;
  @override
  _DescriptionPage createState() => _DescriptionPage();
}

class _DescriptionPage extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.gameName, style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(255, 238, 173, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 300,
                  // color: Color.fromRGBO(158, 214, 188, 1),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 238, 173, 1),
                      image: DecorationImage(
                        image: NetworkImage(widget.imageURL),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(158, 214, 188, 1),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              widget.gameName,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)
                          ),
                          SizedBox(height: 10,),
                          Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)
                          ),
                          SizedBox(height: 10,),
                          Text(
                            widget.gameDescription,
                            style: TextStyle(
                              fontSize: 16,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  }

}