import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'description.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    String name = '';
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
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
              if (data['favorite'] == true){
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
              }
              return Container(
              );
            },
          )
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class GameObject {
  String GameName;
  GameObject(this.GameName);
    static final List<GameObject> gameinfo = [
      GameObject("Valorant"),
      GameObject("League of Legends"),
      GameObject("Fifa Online 4"),
      GameObject("Marvel's Avengers"),
      GameObject("Apex"),
      GameObject("Dota 2"),
      GameObject("No time to relax"),
      GameObject("The Sims 4"),
    ];
  List<GameObject> get game => gameinfo;
}

class Gameprovider extends ChangeNotifier {
  List<String> game_favorite = [];
  void addgame(String game) {
    game_favorite.add(game);
    notifyListeners();
  }

  void removegame(String game) {
    game_favorite.remove(game);
    notifyListeners();
  }

  List<String> get fav_game => game_favorite;
}
