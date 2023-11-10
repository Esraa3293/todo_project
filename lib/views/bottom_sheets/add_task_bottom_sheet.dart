import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/models/task_model.dart';
import 'package:todo_project/view_models/app_view_model.dart';

class AddTaskBottomSheet extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New Task",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Task Title";
                    }
                    return null;
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    label: const Text(
                      "Task Title",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  autofocus: true,
                  autocorrect: false,
                  //cursorColor: Colors.green,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Select Date",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  viewModel.chooseDate(context);
                },
                child: Text(
                  viewModel.selected.toString().substring(0, 10),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel task = TaskModel(
                        title: controller.text,
                        date: DateUtils.dateOnly(viewModel.selected)
                            .millisecondsSinceEpoch,
                        complete: false);
                    viewModel.addTaskToFirestore(task);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Add Task",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
