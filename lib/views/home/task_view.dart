import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_route/model/task_model.dart';
import 'package:todo_app_route/core/network_layer/firestore_utils.dart';
import 'package:todo_app_route/views/home/widgets/task_item_widget.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: const Alignment(0, 2.8),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              height: 180,
              color: theme.primaryColor,
              child: Text(
                "To Do List",
                style: theme.textTheme.titleLarge,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: CalendarTimeline(
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                  print(selectedDate);
                },
                leftMargin: 20,
                monthColor: Colors.black87,
                dayColor: Colors.black87,
                activeDayColor: theme.primaryColor,
                activeBackgroundDayColor: Colors.white,
                dotColor: Colors.white,
                selectableDayPredicate: (date) {
                  DateTime today = DateTime.now();
                  bool isToday = date.year == today.year &&
                      date.month == today.month &&
                      date.day == today.day;
                  return date.day != 23 || isToday;
                },
                // selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirestoreUtils.getRealTimeDataFromFirestore(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.error.toString()),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              }

              var tasksList =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              print('Fetched Tasks: $tasksList');

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    TaskItemWidget(taskModel: tasksList[index]),
                itemCount: tasksList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
