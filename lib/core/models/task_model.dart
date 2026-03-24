class TaskModel {
  String id, startTime, endTime, date, title, describtion;
  bool isCompleted;

  TaskModel({
    required this.date,
    required this.describtion,
    required this.endTime,
    required this.isCompleted,
    required this.startTime,
    required this.title,
    required this.id,
  });
}
