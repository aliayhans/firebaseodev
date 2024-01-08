import 'package:flutter/material.dart';

class Character with ChangeNotifier {
  String? id;
  String name;
  String surname;
  String age;
  String gender;

  Character(this.name, this.surname, this.age, this.gender);

  Character.fromMap(this.id, Map<String, dynamic> map)
      : name = map["name"],
        surname = map["surname"],
        age = map["age"],
        gender = map["gender"];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "surname": surname,
      "age": age,
      "gender": gender,
    };
  }
}
