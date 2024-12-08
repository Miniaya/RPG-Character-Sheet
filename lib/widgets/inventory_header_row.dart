import 'package:flutter/material.dart';

class InventoryHeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text('Item',
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
            )
          )
        ),
        Expanded(
          child: Center(
            child: Text('Weight (lb)',
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
            )
          )
        ),
        Expanded(
          child: Center(
            child: Text('Quantity',
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
            )
          )
        )
      ]
    );
  }
}