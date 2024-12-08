import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/character.dart';
import '../models/item.dart';

class CharacterController {
  final storage = Hive.box("storage");

  RxList characters;

  CharacterController() : characters = [].obs {
    if (storage.get('characters') == null) {
      storage.put('characters', []);
    }

    characters.value = storage
      .get('characters')
      .map(
        (character) => Character.fromJson(character),
      )
      .toList();
  }

  void _save() {
    storage.put(
      'characters',
      characters.map((character) => character.toJson()).toList(),
    );
  }

  void add(Character character) {
    characters.add(character);
    _save();
  }

  void addItem(int index, Item item) {
    characters[index].items.add(item);
    _save();
  }

  get size => characters.length;
}