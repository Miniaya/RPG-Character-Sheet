import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/character_controller.dart';

import '../widgets/item_row.dart';
import '../widgets/inventory_header_row.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/custom_scaffold.dart';

class InventoryScreen extends StatelessWidget {
  final characterController = Get.find<CharacterController>();
  var _padding = EdgeInsets.only(bottom: 10);

  @override
  Widget build(BuildContext context) {
    var id = int.parse(Get.parameters['id']!);
    var character = characterController.characters[id];

    double carryingWeight = character.items.fold(0, (prev, curr) => prev + (curr.weight * curr.quantity));

    return CustomScaffold(
      appBar: AppBar(
        title: Text('${character.name}´s inventory'),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ResponsiveWidget(
          mobile: Column(
            children: [
              Padding(
                padding: _padding,
                child: Text('Total carrying weight: ${carryingWeight} lb'),
              ),
              InventoryHeaderRow(),
              const Divider(),
              Expanded(
                child: Obx(() =>
                  characterController.characters[id].items.length > 0
                    ? ListView.builder(
                      itemCount: character.items.length,
                      itemBuilder: (context, index) {
                        final item = character.items[index];
                        return index % 2 == 0
                          ? ItemRow(item, Color(0x00000000))
                          : ItemRow(item, Color(0xD3D3D3CC));
                      },
                    )
                    : Text('No items in inventory')
                )
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/inventory/add', arguments: id),
                  child: const Text('+ Add new item')
                )
              ),
            ]
          ),
          tablet: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: _padding,
                      child: Text('Total carrying weight: ${carryingWeight} lb'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: _padding,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed('/inventory/add', arguments: id),
                          child: const Text('+ Add new item')
                        )
                      )
                    )
                  )
                ]
              ),
              InventoryHeaderRow(),
              const Divider(),
              Expanded(
                child: Obx(() =>
                  characterController.characters[id].items.length > 0
                    ? ListView.builder(
                      itemCount: character.items.length,
                      itemBuilder: (context, index) {
                        final item = character.items[index];
                        return index % 2 == 0
                          ? ItemRow(item, Color(0x00000000))
                          : ItemRow(item, Color(0xD3D3D3CC));
                      },
                    )
                    : Text('No items in inventory')
                )
              ),
            ]
          ),
          desktop: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: _padding,
                      child: Text('Total carrying weight: ${carryingWeight} lb'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: _padding,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed('/inventory/add', arguments: id),
                          child: const Text('+ Add new item')
                        )
                      )
                    )
                  )
                ]
              ),
              InventoryHeaderRow(),
              const Divider(),
              Expanded(
                child: Obx(() =>
                  characterController.characters[id].items.length > 0
                    ? ListView.builder(
                      itemCount: character.items.length,
                      itemBuilder: (context, index) {
                        final item = character.items[index];
                        return index % 2 == 0
                          ? ItemRow(item, Color(0x00000000))
                          : ItemRow(item, Color(0xD3D3D3CC));
                      },
                    )
                    : Text('No items in inventory')
                )
              ),
            ]
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/character/${id}'),
        child: const Icon(Icons.man),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}