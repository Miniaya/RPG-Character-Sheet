import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:hive_ce_flutter/hive_flutter.dart';

import './screens/character_screen.dart';
import './screens/home_screen.dart';
import './screens/add_character_screen.dart';
import './screens/inventory_screen.dart';
import './screens/add_item_screen.dart';

import './controllers/character_controller.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");

  Get.lazyPut<CharacterController>(() => CharacterController());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/character/add', page: () => AddCharacterScreen()),
        GetPage(name: '/character/:id', page: () => CharacterScreen()),
        GetPage(name: '/character/:id/inventory', page: () => InventoryScreen()),
        GetPage(name: '/inventory/add', page: () => AddItemScreen())
      ],
    );
  }
}