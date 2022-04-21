import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gammation/description.dart';

import 'favorite.dart';

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(158, 214, 188, 1.0),
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
              ? FirebaseFirestore.instance //if search
                  .collection('Games')
                  .where('caseSearch', arrayContains: name) //Check that the query is null or not the check the search with caseSeach that contian in firebase or not.
                  .snapshots()
              : FirebaseFirestore.instance.collection('Games').snapshots(), //if not search
          builder: (context, snapshot) {
            return snapshot.hasData // Check that snapshot have data or not
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
                                          gameDescription: data['Description'],
                                          newsTitle: data['newsTitle'],
                                          newsImage: data['newsImage'],
                                          newsDescription: data['newsDescription'],
                                        )
                                    )
                                );
                              },
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Image.network(data['Image']),
                                      Text(data['Name'])
                                    ],
                                ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width*0.8,
                                        top: MediaQuery.of(context).size.height*0.005
                                    ),
                                    child: GestureDetector(
                                      child: Icon (
                                        Icons.star,
                                        color: data['favorite'] ? Color.fromRGBO(255, 175, 56, 1.0) : Colors.grey,
                                      ),
                                      onTap: () async {
                                        await FirebaseFirestore.instance.collection('Games')
                                            .doc(data['Name'])
                                            .update({'favorite': !data['favorite']});
                                      },
                                    ),
                                  ),
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
