import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gammation/description.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      // body: ListView(
      //   children: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.all(10.0),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           hintText: 'Search ...',
      //           enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.all(Radius.circular(180)),
      //             borderSide:
      //                 BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.all(Radius.circular(180)),
      //             borderSide:
      //                 BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
      //           ),
      //           fillColor: Color.fromRGBO(255, 238, 173, 1),
      //           filled: true,
      //           contentPadding: EdgeInsets.only(left: 25.0),
      //         ),
      //         onChanged: (query) {
      //           name = query;
      //         },

      //       ),
      //     ),
      //     SizedBox(
      //       height: 10.0,
      //     ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(158, 214, 188, 1),
          title: Card(
            color: Color.fromRGBO(158, 214, 188, 1),
            elevation: 0,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search ...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                  borderSide: BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                  borderSide: BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
                ),
                fillColor: Color.fromRGBO(255, 238, 173, 1),
                filled: true,
                contentPadding: EdgeInsets.only(left: 25.0),
              ),
              onChanged: (query) {
                setState(() {
                  name = query;
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: (name != '' && name != null)
              ? FirebaseFirestore.instance
                  .collection('Games')
                  .where('caseSearch', arrayContains: name)
                  .snapshots()
              : FirebaseFirestore.instance.collection('Games').snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Card(
                        margin: EdgeInsets.fromLTRB(20,5,20,5),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        DescriptionPage(
                                          imageURL: data['Image'],
                                          gameName: data['Name'],
                                          gameDescription: data['Description'],)
                                    )
                                );
                              },
                              child: Column(
                                children: [
                                  Image.network(data['Image']),
                                  Text(data['Name']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      //   ],
      // ),
    );
  }
}
