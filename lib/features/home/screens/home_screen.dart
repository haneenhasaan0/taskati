import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/features/add_task/screens/add_edit_task_screen.dart';
import 'package:taskati/features/complete_profile/complete_profile_screen.dart';
import 'package:taskati/features/home/widgets/home_date_picker.dart';

import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/tasks/task_builder.dart';
import 'package:taskati/features/home/widgets/tasks/task_card.dart';

import '../../../hive/hive_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedDate = DateFormat('dd MMM, yyyy').format(DateTime.now());
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CompleteProfileScreen()));},
              icon: Icon(
                Icons.arrow_back, color: AppColors.blackColor, size: 30,)),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.backgroundColor,
          onPressed: () {
            pushTo(context, AddEditTaskScreen());
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                HomeHeader(),
                Gap(24),
                //    DailyProgress(),
                Gap(24),
                HomeDatePicker(
                  onDateChange: (date) {
                    setState(() {
                      selectedDate=DateFormat('dd MMM, yyyy').format(date);
                    });
                  },
                ),
                Gap(16),
               _filterTabs(context),
                Gap(20),
                ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: HiveHelperr.taskBox.listenable(),
                  builder:(context,box,child) {
                    List<TaskModel> tasks=[];
                    for(var anyTask in box.values){
                      if(anyTask.date==selectedDate){
                        tasks.add(anyTask);
                      }
                    }
                    final List<TaskModel> inProgressTask=tasks.where((task)=>!task.isCompleted).toList();
                    final List<TaskModel> completedTask=tasks.where((task)=>task.isCompleted).toList();
                    return Expanded(child: TabBarView(children: [
                      TaskBuilder(tasks: tasks),
                      TaskBuilder(tasks: inProgressTask),
                      TaskBuilder(tasks: completedTask),
                    ]));
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonsTabBar _filterTabs(BuildContext context) {
    return ButtonsTabBar(
      backgroundColor: AppColors.primaryColor,
      borderWidth: 3,
      borderColor: Colors.black,
      labelStyle: TextStyles.caption1.copyWith(
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyles.caption1.copyWith(
        color: AppColors.primaryColor,
        // fontWeight: FontWeight.bold,
      ),
      unselectedBackgroundColor: AppColors.accentColor,
      radius: 12,
      buttonMargin: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      contentCenter: true,
      width: (MediaQuery
          .sizeOf(context)
          .width - 40) / 3,
      tabs: [
        Tab(text: 'All'),
        Tab(text: 'In Progress'),
        Tab(text: 'Completed'),
      ],
    );
  }
}


