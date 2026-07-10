import 'package:flutter/material.dart';
import 'package:taskati/core/models/task_model.dart';

import '../../../../core/styles/colors.dart';

class FilteredTasks extends StatelessWidget {
  final List<TaskModel> tasks;

  const FilteredTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: Text(tasks[index].title ?? '')),
        );
      },
    );
  }
}
