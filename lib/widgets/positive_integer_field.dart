import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PositiveIntegerField extends StatelessWidget {
  String _name, _label;

  PositiveIntegerField(this._name, this._label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FormBuilderTextField(
        name: _name,
        decoration: InputDecoration(labelText: _label),
        autovalidateMode: AutovalidateMode.always,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(),
            FormBuilderValidators.integer(),
            FormBuilderValidators.positiveNumber(),
          ],
        ),
      )
    );
  }
}