import 'package:get/get.dart';
import 'dart:convert';
import './item.dart';

class Character {
  final String _name, _gender, _race, _class;
  Map<String, Map> _ability_scores;
  int _level, _hp, _speed, _ac;
  List<Item> _items;

  Character(
    this._name,
    this._gender,
    this._race,
    this._class,
    this._level,
    this._hp,
    this._speed,
    this._ac,
    this._ability_scores,
    this._items
  );

  get name => _name;
  get gender => _gender;
  get race => _race;
  get characterClass => _class;
  get level => _level;
  get hitPoints => _hp;
  get speed => _speed;
  get armorClass => _ac;
  get abilityScores => _ability_scores;
  get items => _items;

  Map toJson() => {
    'name': _name,
    'gender': _gender,
    'race': _race,
    'class': _class,
    'level': _level,
    'hp': _hp,
    'speed': _speed,
    'ac': _ac,
    'ability_scores': _ability_scores,
    'items': _items.map((item) => item.toJson()).toList()
  };

  factory Character.fromJson(Map json) {
    return Character(
      json['name'],
      json['gender'],
      json['race'],
      json['class'],
      json['level'],
      json['hp'],
      json['speed'],
      json['ac'],
      Map<String, Map>.from(json['ability_scores']),
      List.from(json['items']).map((dynamic i) => Item.fromJson(i)).toList()
    );
  }
}