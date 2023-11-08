import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/view_models/app_view_model.dart';
import 'package:todo_project/views/widgets/task_item.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFFBCCE7),
          body: Column(
            children: [
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateSelected: (date) =>
                    viewModel.selected = DateUtils.dateOnly(date),
                leftMargin: 20,
                monthColor: Colors.teal,
                dayColor: Colors.teal[200],
                activeDayColor: Colors.white,
                activeBackgroundDayColor: const Color(0xFFD1E8FF),
                dotsColor: const Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
              StreamBuilder(
                stream: viewModel.getTasksFromFirestore(viewModel.selected),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  viewModel.tasks =
                      snapshot.data?.docs.map((doc) => doc.data()).toList() ??
                          [];
                  if (viewModel.tasks.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Tasks",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            TaskItem(viewModel.tasks[index]),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: viewModel.tasks.length),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
