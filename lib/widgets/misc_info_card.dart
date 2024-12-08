import 'package:flutter/material.dart';

class MiscInfoCard extends StatelessWidget {
  String _title, _subtitle;

  MiscInfoCard(this._title, this._subtitle);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Card(
          child: SizedBox(
            width: 150,
            child: ListTile(
              title: Center( 
                child: Text(_title)
              ),
              subtitle: Center(
                child: Text(_subtitle,
                  style: TextStyle(fontSize: 12),
                )
              )
            )
          )
        )
      )
    );
  }
}