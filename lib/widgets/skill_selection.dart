import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import './responsive_widget.dart';

class SkillSelection extends StatelessWidget {
  List<String> _skills;

  SkillSelection(this._skills);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    _skills.sort((a, b) => a.compareTo(b));
    final skillRows = _skills.map(
      (skill) => FormBuilderCheckbox(
          name: skill,
          title: Text(skill),
          initialValue: false
        )
      ).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Proficiency / Skill',
          style: TextStyle(
            fontWeight: FontWeight.bold
          )
        ), 
        ResponsiveWidget(
          mobile: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (5 / 1),
            shrinkWrap: true,
            children: skillRows,
          ),
          tablet: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: (5 / 1),
            shrinkWrap: true,
            children: skillRows,
          ),
          desktop: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: (5 / 1),
            shrinkWrap: true,
            children: skillRows,
          ),
        )
      ]
    );
  }
}