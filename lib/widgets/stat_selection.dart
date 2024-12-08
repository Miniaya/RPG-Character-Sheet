import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class StatSelection extends StatelessWidget {
  Map stats = {
    'STR': 'Strength',
    'DEX': 'Dexterity',
    'CON': 'Constitution',
    'INT': 'Intelligence',
    'WIS': 'Wisdom',
    'CHA': 'Charisma'
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: stats.entries.map(
        (stat) => FormBuilderSlider(
          name: stat.key,
          initialValue: 8,
          min: 1,
          max: 20,
          divisions: 19,
          decoration: InputDecoration(labelText: stat.value),
        ),
      ).toList(),
    );
  }
}