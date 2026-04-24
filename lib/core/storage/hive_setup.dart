import 'package:hive_flutter/hive_flutter.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register adapters here if needed
    // Hive.registerAdapter(MyModelAdapter());

    // Open common boxes
    await Hive.openBox('appBox');
  }

  static Box get appBox => Hive.box('appBox');
}
