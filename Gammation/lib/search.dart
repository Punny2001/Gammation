// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class SearchGame extends StatelessWidget {
//   const SearchGame({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//             backgroundColor: Color.fromRGBO(158, 214, 188, 1),
//             title: Card(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search ...',
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(180)),
//                     borderSide: BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(180)),
//                     borderSide: BorderSide(color: Color.fromRGBO(255, 238, 173, 1)),
//                   ),
//                   fillColor: Color.fromRGBO(255, 238, 173, 1),
//                   filled: true,
//                   contentPadding: EdgeInsets.only(left: 25.0),
//                 ),
//                 onChanged: (query) {
//                   setState(() {
//                     name = query;
//                   });
//                 },
//               ),
//             ),
//           ),
//           body: StreamBuilder<QuerySnapshot>(
//             stream: (name != '' && name != null)
//                 ? FirebaseFirestore.instance
//                     .collection('Games')
//                     .where('caseSearch', arrayContains: name)
//                     .snapshots()
//                 : FirebaseFirestore.instance.collection('Games').snapshots(),
//             builder: (context, snapshot) {
//               return snapshot.hasData
//                   ? ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         DocumentSnapshot data = snapshot.data!.docs[index];
//                         return Card(
//                           child: Row(
//                             children: <Widget>[
//                               Text(data['Name']),
//                             ],
//                           ),
//                         );
//                       },
//                     )
//                   : Center(
//                       child: CircularProgressIndicator(),
//     );
//   }
// }
