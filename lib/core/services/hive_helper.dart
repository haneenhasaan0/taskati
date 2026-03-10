
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
abstract class HiveHelper {
  // boxes
  static late Box userBox;

  // box keys
  static String userBoxKey = 'userBox';
  static String taskBoxKey = 'taskBox';

  // keys
  static String nameKey = 'name';
  static String imageKey = 'image';
  static String isUploadedKey = 'isUploaded';



  static Future<void> init() async {
    await Hive.initFlutter();
    userBox = await Hive.openBox(userBoxKey);

  }

  static Future<void> setUserData(String name, String image) async {
    await cacheData(nameKey, name);
    await cacheData(imageKey, image);
  }

  static Future<void> cacheData(String key, dynamic value) async {
    await userBox.put(key, value);
  }

  static dynamic getData(String key) {
    return userBox.get(key);
  }

}
