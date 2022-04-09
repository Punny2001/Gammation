import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  var _isadded = List<bool>.filled(GameObject.gameinfo.length, false);
  @override
  Widget build(BuildContext context) {
    var favorite = context.watch<Gameprovider>();
    return Scaffold(
      backgroundColor: Color.fromRGBO(158, 214, 188, 1),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: GameObject.gameinfo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(GameObject.gameinfo[index].GameName),
                      trailing: TextButton(
                          onPressed: () {
                            // print(index);
                            if (!_isadded[index]) {
                              context
                                  .read<Gameprovider>()
                                  .addgame(GameObject.gameinfo[index].GameName);
                            } else {
                              context.read<Gameprovider>().removegame(
                                  GameObject.gameinfo[index].GameName);
                            }
                            setState(() {
                              _isadded[index] = !_isadded[index];
                            });
                          },
                          child: Icon(
                            Icons.star,
                            color: _isadded[index] ? Colors.pink : Colors.grey,
                          )),
                    );
                  }),
            ),
          ],
        ),
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
