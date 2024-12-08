import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/character_controller.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final characterController = Get.find<CharacterController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: CustomScaffold(
        appBar: AppBar(
          title: const Text('My Characters'),
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: Obx(() =>
                  characterController.size > 0
                    ? ListView.builder(
                      itemCount: characterController.size,
                      itemBuilder: (context, index) {
                        final character = characterController.characters[index];
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: OutlinedButton(
                            child: Text(character.name),
                            onPressed: () => Get.toNamed('/character/${index}')
                          )
                        );
                      },
                    )
                    : Center(
                      child: Text('No Characters')
                    )
                )
              ),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed('/character/add'),
          child: const Icon(Icons.add),
        ),
      ),
      tablet: CustomScaffold(
        appBar: AppBar(
          title: const Text('My Characters'),
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: Obx(() =>
                  characterController.size > 0
                    ? SizedBox(
                        width: 600,
                        child: ListView.builder(
                        itemCount: characterController.size,
                        itemBuilder: (context, index) {
                          final character = characterController.characters[index];
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: OutlinedButton(
                              child: Text(character.name),
                              onPressed: () => Get.toNamed('/character/${index}')
                            )
                          );
                        },
                      )
                    )
                    : Text('No Characters')
                )
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/character/add'),
                  child: const Text('+ Add a New Character')
                )
              ),
            ]
          ),
        )
      ),
      desktop: CustomScaffold(
        appBar: AppBar(
          title: const Text('My Characters'),
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed('/character/add'),
                    child: const Text('+ Add a New Character')
                  )
                ),
              ),
              Expanded(
                child: Obx(() =>
                  characterController.size > 0
                    ? SizedBox(
                        width: 600,
                        child: ListView.builder(
                        itemCount: characterController.size,
                        itemBuilder: (context, index) {
                          final character = characterController.characters[index];
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: OutlinedButton(
                              child: Text(character.name),
                              onPressed: () => Get.toNamed('/character/${index}')
                            )
                          );
                        },
                      )
                    )
                    : Text('No Characters')
                )
              ),
            ]
          ),
        )
      ),
    );
  }
}