import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox('appBox');

    if (!appBox.containsKey('device_id')) {
      final uuid = const Uuid().v4();
      await appBox.put('device_id', uuid);
    }
  }

  static Box get appBox => Hive.box('appBox');

  static String get deviceId => appBox.get('device_id', defaultValue: 'unknown-device');

  static String get token => appBox.get('token', defaultValue: '');

  static set token(String value) => appBox.put('token', value);
}
