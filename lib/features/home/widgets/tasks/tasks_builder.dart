import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/features/add_task/screens/add_edit_task_screen.dart';
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
        return Slidable(
          // key: const ValueKey(0),
          // key: UniqueKey(),
          key: ValueKey(task.id),
          closeOnScroll: true,
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                HiveHelper.taskBox.delete(task.id);
              },
            ),
            children: [
              SlidableAction(
                onPressed: (context) {
                  HiveHelper.taskBox.delete(task.id);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  HiveHelper.cacheTask(
                    task.id,
                    task.copyWith(isCompleted: true),
                  );
                },
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.done,
                label: 'Complete',
              ),
              SlidableAction(
                onPressed: (context) {
                  pushTo(context, AddEditTaskScreen(task: task));
                },
                backgroundColor: AppColors.primary50Color,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          child: TaskCard(task: task),
        );
      },

      separatorBuilder: (context, index) => Gap(12),
    );
  }
}
