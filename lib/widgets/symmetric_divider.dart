import 'package:flutter/material.dart';

class SymmetricDivider extends StatelessWidget {
  double _padding;

  SymmetricDivider(this._padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _padding),
      child: const Divider()
    );
  }
}