import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/models/task_model.dart';
import 'package:todo_project/view_models/app_view_model.dart';

class EditTask extends StatelessWidget {
  static const String routeName = 'update';
  var controller = TextEditingController();

  EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    controller.text = task.title;
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFFBCCE7),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 100,
              bottom: 100,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Edit Task",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
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
                      cursorColor: Colors.green,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
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
                        viewModel.updateTask(task.id, task);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            task.title = controller.text;
                            viewModel.updateTask(task.id, task);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
