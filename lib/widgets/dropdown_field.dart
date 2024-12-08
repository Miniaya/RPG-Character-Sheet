import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DropdownField extends StatelessWidget {
  String _name, _label, _hint;
  List<String> _itemList;

  DropdownField(this._name, this._label, this._hint, this._itemList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FormBuilderDropdown<String>(
        name: _name,
        decoration: InputDecoration(
          labelText: _label,
          hintText: _hint,
        ),
        autovalidateMode: AutovalidateMode.always,
        validator: FormBuilderValidators.required(),
        items: _itemList
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      )
    );
  }
}