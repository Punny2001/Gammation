import 'dart:ui';

class Game {
  String? name;
  String? description;
  DateTime? releasedate;

  Game({this.name, this.description, this.releasedate});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      name: json['Name'],
      description: json['Description'],
      releasedate: json['ReleaseDate'],
    );
  }
}
