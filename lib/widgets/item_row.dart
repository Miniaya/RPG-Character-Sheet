import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemRow extends StatelessWidget {
  Item _item;
  Color _color;

  ItemRow(this._item, this._color);

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: _color,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text('${_item.name}')
            )
          ),
          Expanded(
            child: Center(
              child: Text('${_item.weight}')
            )
          ),
          Expanded(
            child: Center(
              child: Text('${_item.quantity}')
            )
          )
        ]
      )
    );
  }
}