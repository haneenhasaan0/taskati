import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskati/core/hive/hive_adapter.dart';
import 'package:taskati/core/models/task_model.dart';

abstract class HiveHelperr {
  static late Box userBox;
  static late Box<TaskModel> taskBox;
  static String userBoxKey='userBox';
  static String taskBoxKey='taskBox';

  static Future<void> init()async{
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    userBox=await Hive.openBox(userBoxKey);
    taskBox=await Hive.openBox<TaskModel>(taskBoxKey);
  }
  static Future<void> cashedTask(String key,TaskModel value)async{
    await taskBox.put(key, value);
  }
  static TaskModel? getCashedTask(String key){
    return taskBox.get(key);
  }
  static Future<void> cashedUser(String key,dynamic value)async{
    await userBox.put(key, value);
  }
 static getUserData(String key){
    return userBox.get(key);
  }

}