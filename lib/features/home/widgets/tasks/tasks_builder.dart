// import 'package:easy_date_timeline/easy_date_timeline.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/models/task_model.dart';
// import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_svg_picture.dart';
import 'package:taskati/features/home/widgets/tasks/task_card.dart';

class TasksBuilder extends StatefulWidget {
  const TasksBuilder({super.key, required this.tasks});
  final List<TaskModel> tasks;

  @override
  State<TasksBuilder> createState() => _TasksBuilderState();
}

class _TasksBuilderState extends State<TasksBuilder> {
  // List<TaskModel> tasks = [];
  @override
  void initState() {
    super.initState();
    // tasks = HiveHelper.taskBox.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // itemCount: 3,
      // itemCount:tasks.length,
      itemCount: widget.tasks.length,

      itemBuilder: (context, index) {
        var task = widget.tasks[index];
        return TaskCard(task: task);
      },

      separatorBuilder: (context, index) => Gap(12),
    );
  }
}
