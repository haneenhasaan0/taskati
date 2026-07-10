// import 'package:hive_ce_flutter/hive_ce_flutter.dart';
// import 'package:taskati/core/models/task_model.dart';
//
// abstract class HiveHelper {
//
//   static Future<void> cashedUser(String key,dynamic value)async{
//     await userBox.put(key, value);
//   }
//   static getUserData(String key){
//     return userBox.get(key);
//   }
//
//   // boxes
//   static late Box userBox;
//   static late Box<TaskModel> taskBox;
//
//   // box keys
//   static String userBoxKey = 'userBox';
//   static String taskBoxKey = 'taskBox';
//
//   // keys
//   static String nameKey = 'name';
//   static String imageKey = 'image';
//   static String isUploadedKey = 'isUploaded';
//
//   static Future<void> init() async {
//     await Hive.initFlutter();
//     Hive.registerAdapters();
//     userBox = await Hive.openBox(userBoxKey);
//     taskBox=await Hive.openBox<TaskModel>(taskBoxKey);
//   }
//
//   // static Future<void> setUserData(String name, String image) async {
//   //   await cachedData(nameKey, name);
//   //   await cachedData(imageKey, image);
//   // }
//
//   static Future<void> cashedTask(String key,TaskModel task)async {
//     await taskBox.put(key, task);
//   }
//   static getTasks(String key){
//     return taskBox.values.toList();
//   }
//
// }
