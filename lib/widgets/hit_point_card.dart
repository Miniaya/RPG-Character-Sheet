import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/character.dart';

class HitPointCard extends StatelessWidget {
  Character _character;
  RxInt _hitPoints;

  HitPointCard(this._character) : _hitPoints = 0.obs {
    _hitPoints.value = _character.hitPoints;
  }

  void _increment() {
    if (_hitPoints < _character.hitPoints) {
      _hitPoints++;
    }
  }

  void _decrement() {
    if (_hitPoints > 0) {
      _hitPoints--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 400,
          child: ListTile(
            title: Center(
              child: Obx(
                () => Text('${_hitPoints} / ${_character.hitPoints}')
              )
            ),
            subtitle: Center( 
              child: Text('Hit Points')
            ),
            leading: ElevatedButton(
              onPressed: _decrement,
              child: const Icon(Icons.remove),
            ),
            trailing: ElevatedButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
            ),
          )
        )
      )
    );
  }
}