// import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:taskati/features/home/widgets/daily_progress.dart';
import 'package:taskati/features/home/widgets/home_date_picker.dart';

import 'package:taskati/features/home/widgets/home_header.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              HomeHeader(),
              Gap(24),
              DailyProgress(),
              Gap(24),
              HomeDatePicker(
                onDateChange: (date) {
                  setState(() {
                    //  print(date);    // 2026-03-24 00:00:00.000          // 2026-03-20 00:00:00.000
                    selectedDate = DateFormat('dd MMM, yyyy').format(date);
                    // print(selectedDate);    //  20 Mar, 2026
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
