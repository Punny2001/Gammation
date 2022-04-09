// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gammation/models/game.dart';
// import 'package:flutter/material.dart';

// class GameSearch extends StatelessWidget {
//   const GameSearch({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return buildResult(context);
//   }

//   @override
//   Widget buildResult(BuildContext context) {
//     CollectionReference _game = FirebaseFirestore.instance.collection('Games')
//     return StreamBuilder<QuerySnapshot>(
//         stream: _game.snapshots().asBroadcastStream(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             // Fetch Data here
//             print(snapshot.data);
//             return ListView(
//               children: [
//                 ...snapshot.data!.docs
//                     .where((QueryDocumentSnapshot element) => element['Name']
//                         .toString()
//                         .toLowerCase()
//                         .contains())
//                     .map((QueryDocumentSnapshot<Object?> data) {
//                   final String name = data.get('Name');
//                   final String description = data.get('Description');
//                   final DateTime releasedate = data.get('ReleaseDate');

//                   return ListTile(
//                     onTap: () {},
//                     title: Text(name),
//                     subtitle: Text(releasedate as String),
//                   );
//                 })
//               ],
//             );
//           }
//         });
//   }
// }
