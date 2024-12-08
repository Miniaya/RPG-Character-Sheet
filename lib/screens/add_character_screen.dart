import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../models/character.dart';

import '../controllers/character_controller.dart';

import '../widgets/skill_selection.dart';
import '../widgets/stat_selection.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/symmetric_divider.dart';
import '../widgets/positive_integer_field.dart';
import '../widgets/dropdown_field.dart';
import '../widgets/custom_scaffold.dart';

class AddCharacterScreen extends StatelessWidget {
  final characterController = Get.find<CharacterController>();
  final _formKey = GlobalKey<FormBuilderState>();
  
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> raceOptions = ['Dwarf', 'Elf', 'Halfling', 'Human', 'Dragonborn', 'Gnome', 'Half-Elf', 'Half-Orc', 'Tiefling'];
  List<String> classOptions = ['Barbarian', 'Bard', 'Cleric', 'Druid', 'Fighter', 'Monk', 'Paladin', 'Ranger', 'Rogue', 'Sorcerer', 'Warlock', 'Wizard'];
  List<String> strSkills = ['Athletics'];
  List<String> dexSkills = ['Acrobatics', 'Sleight of Hand', 'Stealth'];
  List<String> intSkills = ['Arcana', 'History', 'Investigation', 'Nature', 'Religion'];
  List<String> wisSkills = ['Animal Handling', 'Insight', 'Medicine', 'Perception', 'Survival'];
  List<String> chaSkills = ['Deception', 'Intimidation', 'Performance', 'Persuation'];

  _save() {
    if (_formKey.currentState!.saveAndValidate()) {
      var form = _formKey.currentState!;
      characterController.add(
        Character(
          form.value['name'],
          form.value['gender'],
          form.value['race'],
          form.value['class'],
          int.parse(form.value['level']),
          int.parse(form.value['hp']),
          int.parse(form.value['speed']),
          int.parse(form.value['ac']),
          {
            'STR': {
              'score': form.value['STR'],
              'skills': Map.fromIterable(strSkills, key: (skill) => skill, value: (skill) => form.value[skill])
            },
            'DEX': {
              'score': form.value['DEX'],
              'skills': Map.fromIterable(dexSkills, key: (skill) => skill, value: (skill) => form.value[skill])
            },
            'CON': {
              'score': form.value['CON'],
              'skills': {}
            },
            'INT': {
              'score': form.value['INT'],
              'skills': Map.fromIterable(intSkills, key: (skill) => skill, value: (skill) => form.value[skill])
            },
            'WIS': {
              'score': form.value['WIS'],
              'skills': Map.fromIterable(wisSkills, key: (skill) => skill, value: (skill) => form.value[skill])
            },
            'CHA': {
              'score': form.value['CHA'],
              'skills': Map.fromIterable(chaSkills, key: (skill) => skill, value: (skill) => form.value[skill])
            },
          },
          []
        )
      );
      _formKey.currentState?.reset();
      Get.toNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text('Add a New Character'),
      ),
      child: Center(
        child: FormBuilder(
          key: _formKey,
          child: ResponsiveWidget(
            mobile: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(labelText: 'Name'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: FormBuilderValidators.required(),
                ),
                DropdownField('gender', 'Gender', 'Select Gender', genderOptions),
                DropdownField('race', 'Race', 'Select Race', raceOptions),
                DropdownField('class', 'Class', 'Select Class', classOptions),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: const Divider()
                ),
                PositiveIntegerField('level', 'Level'),
                PositiveIntegerField('hp', 'Hit Points'),
                PositiveIntegerField('speed', 'Walking Speed'),
                PositiveIntegerField('ac', 'Armor Class'),
                SymmetricDivider(25),
                StatSelection(),
                SymmetricDivider(25),
                SkillSelection([...strSkills, ...dexSkills, ...intSkills, ...wisSkills, ...chaSkills]),
                ElevatedButton(
                  onPressed: _save,
                  child: Text("Save Character"),
                ),
              ]
            ),
            tablet: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'name',
                        decoration: const InputDecoration(labelText: 'Name'),
                        autovalidateMode: AutovalidateMode.always,
                        validator: FormBuilderValidators.required(),
                      )
                    ),
                    Expanded(
                      child: DropdownField('gender', 'Gender', 'Select Gender', genderOptions),
                    )
                  ]
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownField('race', 'Race', 'Select Race', raceOptions),
                    ),
                    Expanded(
                      child: DropdownField('class', 'Class', 'Select Class', classOptions),
                    )
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: const Divider()
                ),
                Row(
                  children: [
                    Expanded(
                      child: PositiveIntegerField('level', 'Level'),
                    ),
                    Expanded(
                      child: PositiveIntegerField('hp', 'Hit Points'),
                    ),
                    Expanded(
                      child: PositiveIntegerField('speed', 'Walking Speed'),
                    ),
                    Expanded(
                      child: PositiveIntegerField('ac', 'Armor Class'),
                    )
                  ]
                ),
                SymmetricDivider(25),
                StatSelection(),
                SymmetricDivider(25),
                SkillSelection([...strSkills, ...dexSkills, ...intSkills, ...wisSkills, ...chaSkills]),
                ElevatedButton(
                  onPressed: _save,
                  child: Text("Save Character"),
                ),
              ]
            ),
            desktop: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FormBuilderTextField(
                          name: 'name',
                          decoration: const InputDecoration(labelText: 'Name'),
                          autovalidateMode: AutovalidateMode.always,
                          validator: FormBuilderValidators.required(),
                        )
                      )
                    ),
                    Expanded(
                      child: DropdownField('gender', 'Gender', 'Select Gender', genderOptions),
                    ),
                    Expanded(
                      child: DropdownField('race', 'Race', 'Select Race', raceOptions),
                    ),
                    Expanded(
                      child: DropdownField('class', 'Class', 'Select Class', classOptions),
                    )
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: const Divider()
                ),
                Row(
                  children: [
                    Expanded(
                      child: PositiveIntegerField('level', 'Level'),
                    ),
                    Expanded(
                      child: PositiveIntegerField('hp', 'Hit Points'),
                    ),
                    Expanded(
                      child: PositiveIntegerField('speed', 'Walking Speed'),
                    ),
                    Expanded(
                      child: PositiveIntegerField('ac', 'Armor Class'),
                    )
                  ]
                ),
                SymmetricDivider(25),
                StatSelection(),
                SymmetricDivider(25),
                SkillSelection([...strSkills, ...dexSkills, ...intSkills, ...wisSkills, ...chaSkills]),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: _save,
                      child: Text("Save Character"),
                    ),
                  )
                )
              ]
            ),
          )
        ),
      ),
    );
  }
}
