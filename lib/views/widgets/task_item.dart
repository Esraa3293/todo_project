import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/models/task_model.dart';
import 'package:todo_project/view_models/app_view_model.dart';
import 'package:todo_project/views/edit_task.dart';

import '../bottom_sheets/edit_task_bottom_sheet.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;

  const TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              viewModel.deleteTask(task.id);
            },
            background: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFCDFEF)),
              child: const Icon(
                Icons.delete,
                color: Color(0xFFE3C8D7),
                size: 30,
              ),
            ),
            child: ListTile(
              tileColor: Colors.white,
              titleTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              leading: Checkbox(
                value: task.complete,
                onChanged: (value) {
                  task.complete = value!;
                  viewModel.updateTask(task.id, task);
                },
              ),
              title: Text(task.title),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EditTask.routeName, arguments: task);
                    //viewModel.showBottomSheet(EditTaskBottomSheet(), context);
                  },
                  icon: const Icon(Icons.edit_calendar_outlined)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                //side: BorderSide(color: Colors.grey.shade100),
              ),
            ),
          ),
        );
      },
    );
  }
}
