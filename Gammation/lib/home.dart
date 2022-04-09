import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gamesearch.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search ...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                  borderSide:
                      BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                  borderSide:
                      BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
                ),
                fillColor: Color.fromRGBO(255, 238, 173, 1),
                filled: true,
                contentPadding: EdgeInsets.only(left: 25.0),
              ),
              onChanged: (query) {
                buildResult(context, query);
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget buildResult(BuildContext context, String query) {
    CollectionReference _game = FirebaseFirestore.instance.collection('Games');
    return StreamBuilder<QuerySnapshot>(
        stream: _game.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            // Fetch Data here
            print(snapshot.data);
            return ListView(
              children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot element) => element['Name']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .map((QueryDocumentSnapshot<Object?> data) {
                  final String name = data.get('Name');
                  final String description = data.get('Description');
                  final DateTime releasedate = data.get('ReleaseDate');

                  return ListTile(
                    onTap: () {},
                    title: Text(name),
                    subtitle: Text(releasedate as String),
                  );
                })
              ],
            );
          }
        });
  }
}
