import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati/core/models/task_model.dart';
abstract class HiveHelper {
  // boxes
  static late Box userBox;
  static late Box<TaskModel> taskBox;

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
    taskBox=await Hive.openBox<TaskModel>(taskBoxKey);
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
  static Future<void> cashedTask(String key,TaskModel task)async {
    await taskBox.put(key, task);
  }
  static getTasks(String key){
    return taskBox.values.toList();
  }

}
