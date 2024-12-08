import 'package:flutter/material.dart';

class AbilityScoreCard extends StatelessWidget {
  final String _ability;
  final int _score;

  AbilityScoreCard(this._ability, this._score);
  
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        child: ListTile(
          title: Center( 
            child: Text(_ability)
          ),
          subtitle: Center(
            child: Text('${_score}')
          )
        )
      )
    );
  }
}