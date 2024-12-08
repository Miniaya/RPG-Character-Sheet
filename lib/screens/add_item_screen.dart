import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../models/character.dart';
import '../models/item.dart';

import '../widgets/custom_scaffold.dart';

import '../controllers/character_controller.dart';

class AddItemScreen extends StatelessWidget {
  final characterController = Get.find<CharacterController>();
  final _formKey = GlobalKey<FormBuilderState>();

  _save() {
    if (_formKey.currentState!.saveAndValidate()) {
      var form = _formKey.currentState!;
      characterController.addItem(
        Get.arguments,
        Item(
          form.value['name'],
          double.parse(form.value['weight']),
          int.parse(form.value['quantity'])
        )
      );
      _formKey.currentState?.reset();
      Get.toNamed('/character/${Get.arguments}/inventory');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Add new item'),
      ),
      child: Center(
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(labelText: 'Item name'),
                autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'weight',
                decoration: const InputDecoration(labelText: 'Weight (lb)'),
                autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.numeric()
              ),
              FormBuilderTextField(
                name: 'quantity',
                decoration: const InputDecoration(labelText: 'Quantity'),
                autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.positiveNumber()
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: _save,
                    child: const Text('Add item')
                  )
                )
              ),
            ]
          )
        )
      )
    );
  }
}