import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/character_controller.dart';

import '../widgets/ability_score_card.dart';
import '../widgets/hit_point_card.dart';
import '../widgets/symmetric_divider.dart';
import '../widgets/misc_info_card.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/custom_scaffold.dart';

class CharacterScreen extends StatelessWidget {
  final characterController = Get.find<CharacterController>();

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters['id'];
    var character = characterController.characters[int.parse(id!)];
    var skillRows = [];
    final proficiency = (character.level / 4) + (1 - character.level % 4 / 4);

    for (String abilityScore in character.abilityScores.keys) {
      var abScore = character.abilityScores[abilityScore];
      for (String skill in abScore['skills'].keys) {
        var bonus = ((abScore['score'] / 2) - 5).ceil();
        skillRows.add(Card(
              child: ListTile(
                title: Center(
                  child: Text(skill)
                ),
                trailing: abScore['skills'][skill]
                  ? Text('${bonus + proficiency}',
                    style: TextStyle(fontSize: 15),
                  )
                  : Text('${bonus}',
                    style: TextStyle(fontSize: 15),
                  )
              )
            )
        );
      }
    }

    skillRows.sort((a, b) => a.child.title.child.data.compareTo(b.child.title.child.data));

    return CustomScaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ResponsiveWidget(
          mobile: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text('lvl ${character.level} ${character.gender} ${character.race} ${character.characterClass}')
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed('/character/${id}/inventory'),
                child: Text('Inventory (${character.items.fold(0, (prev, curr) => prev + curr.quantity)})')
              ),
              SymmetricDivider(10),
              const Text('Ability Scores'),
              Row(
                children: [
                  AbilityScoreCard('STR', character.abilityScores['STR']['score']),
                  AbilityScoreCard('DEX', character.abilityScores['DEX']['score']),
                  AbilityScoreCard('CON', character.abilityScores['CON']['score'])
                ]
              ),
              Row(
                children: [
                  AbilityScoreCard('INT', character.abilityScores['INT']['score']),
                  AbilityScoreCard('WIS', character.abilityScores['WIS']['score']),
                  AbilityScoreCard('CHA', character.abilityScores['CHA']['score'])
                ]
              ),
              SymmetricDivider(10),
              Row(
                children: [
                  MiscInfoCard('${character.armorClass}', 'Armor class'),
                  MiscInfoCard('${character.speed} ft.', 'Walking speed'),
                  MiscInfoCard('+${proficiency}', 'Proficiency bonus'),
                ]
              ),
              HitPointCard(character),
              SymmetricDivider(10),
              const Text('Skills'),
              GridView.count(
                crossAxisCount: 1,
                childAspectRatio: (8 / 1),
                shrinkWrap: true,
                children: skillRows.map((skillRow) => skillRow as Widget).toList(),
              ),
            ]
          ),
          tablet: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('lvl ${character.level} ${character.gender} ${character.race} ${character.characterClass}')
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed('/character/${id}/inventory'),
                      child: Text('Inventory (${character.items.fold(0, (prev, curr) => prev + curr.quantity)})')
                    ),
                  )
                ]
              ),
              SymmetricDivider(10),
              const Text('Ability Scores'),
              Row(
                children: [
                  AbilityScoreCard('STR', character.abilityScores['STR']['score']),
                  AbilityScoreCard('DEX', character.abilityScores['DEX']['score']),
                  AbilityScoreCard('CON', character.abilityScores['CON']['score']),
                  AbilityScoreCard('INT', character.abilityScores['INT']['score']),
                  AbilityScoreCard('WIS', character.abilityScores['WIS']['score']),
                  AbilityScoreCard('CHA', character.abilityScores['CHA']['score'])
                ]
              ),
              SymmetricDivider(10),
              Row(
                children: [
                  MiscInfoCard('${character.armorClass}', 'Armor class'),
                  MiscInfoCard('${character.speed} ft.', 'Walking speed'),
                  MiscInfoCard('+${proficiency}', 'Proficiency bonus'),
                ]
              ),
              HitPointCard(character),
              SymmetricDivider(10),
              const Text('Skills'),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (6 / 1),
                shrinkWrap: true,
                children: skillRows.map((skillRow) => skillRow as Widget).toList(),
              ),
            ]
          ),
          desktop: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('lvl ${character.level} ${character.gender} ${character.race} ${character.characterClass}')
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed('/character/${id}/inventory'),
                      child: Text('Inventory (${character.items.fold(0, (prev, curr) => prev + curr.quantity)})')
                    ),
                  )
                ]
              ),
              SymmetricDivider(10),
              const Text('Ability Scores'),
              Row(
                children: [
                  AbilityScoreCard('STR', character.abilityScores['STR']['score']),
                  AbilityScoreCard('DEX', character.abilityScores['DEX']['score']),
                  AbilityScoreCard('CON', character.abilityScores['CON']['score']),
                  AbilityScoreCard('INT', character.abilityScores['INT']['score']),
                  AbilityScoreCard('WIS', character.abilityScores['WIS']['score']),
                  AbilityScoreCard('CHA', character.abilityScores['CHA']['score'])
                ]
              ),
              SymmetricDivider(10),
              Row(
                children: [
                  MiscInfoCard('${character.armorClass}', 'Armor class'),
                  MiscInfoCard('${character.speed} ft.', 'Walking speed'),
                  MiscInfoCard('+${proficiency}', 'Proficiency bonus'),
                ]
              ),
              HitPointCard(character),
              SymmetricDivider(10),
              const Text('Skills'),
              GridView.count(
                crossAxisCount: 3,
                childAspectRatio: (6 / 1),
                shrinkWrap: true,
                children: skillRows.map((skillRow) => skillRow as Widget).toList(),
              ),
            ]
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/'),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}