import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/features/add_task/screens/add_edit_task_screen.dart';
import 'package:taskati/features/home/widgets/tasks/task_card.dart';
import 'package:taskati/hive/hive_helper.dart';

class TaskBuilder extends StatefulWidget {
  const TaskBuilder({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  State<TaskBuilder> createState() => _TaskBuilderState();
}

class _TaskBuilderState extends State<TaskBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 6),
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) => Slidable(
        key: ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {
              // setState(() {
                HiveHelperr.taskBox.delete(widget.tasks[index].id);
                // widget.tasks.removeAt(index);
              // });
            },
          ),

          children: [
            SlidableAction(
              onPressed: (_) {
                HiveHelperr.taskBox.delete(widget.tasks[index].id);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (_) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEditTaskScreen(task: widget.tasks[index],)));
              },
              backgroundColor: const Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: (_) {
                setState(() {
                  widget.tasks[index].isCompleted = true;
                });
              },
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.done,
              label: 'Completed',
            ),
          ],
        ),
        child: TaskCard(tasks: widget.tasks[index]),
      ),
    );
  }
}
