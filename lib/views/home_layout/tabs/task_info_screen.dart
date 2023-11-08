import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/view_models/app_view_model.dart';

class TaskInfoTab extends StatelessWidget {
  const TaskInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFFBCCE7),
          body: StreamBuilder(
            stream: viewModel.getTasksFromFirestore(viewModel.selected),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              viewModel.tasks =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              viewModel.uncompletedTasks = snapshot.data?.docs
                      .map((doc) => doc.data())
                      .where((task) => !task.complete)
                      .toList() ??
                  [];
              viewModel.completedTasks = snapshot.data?.docs
                      .map((doc) => doc.data())
                      .where((task) => task.complete)
                      .toList() ??
                  [];
              return Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Total Tasks",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            viewModel.tasks.length.toString(),
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )),
                  const VerticalDivider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "completed Tasks",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                viewModel.completedTasks.length.toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )),
                      const Divider(),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Remaining Tasks",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                viewModel.uncompletedTasks.length.toString(),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )),
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}

// Column(
// children: [
//  const Text("Tasks Dashboard",
//      style: TextStyle(
//        color: Colors.teal,
//        fontSize: 24,
//        letterSpacing: 10,
//     )),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(4.0),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20)),
// elevation: 10.0,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// const Text(
// "Total Tasks",
// style: TextStyle(
// fontSize: 30, fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// ),
// Text(
// viewModel.tasks.length.toString(),
// style: const TextStyle(
// fontSize: 35,
// fontWeight: FontWeight.bold,
// ),
// textAlign: TextAlign.center,
// )
// ],
// ),
// ),
// ),
// ),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(4.0),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20)),
// elevation: 10.0,
// child: Padding(
// padding: const EdgeInsets.all(26.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// const Text(
// "completed Tasks",
// style: TextStyle(
// color: Colors.green,
// fontSize: 25,
// fontWeight: FontWeight.w500,
// ),
// ),
// Text(
// viewModel.completedTasks.length.toString(),
// style: const TextStyle(
// color: Colors.green,
// fontSize: 25,
// fontWeight: FontWeight.w500,
// ),
// )
// ],
// ),
// ),
// ),
// ),
// ),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(4.0),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20)),
// elevation: 10.0,
// child: Padding(
// padding: const EdgeInsets.all(26.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// const Text(
// "Remaining Tasks",
// style: TextStyle(
// color: Colors.red,
// fontSize: 25,
// fontWeight: FontWeight.w500,
// ),
// ),
// Text(
// viewModel.uncompletedTasks.length.toString(),
// style: const TextStyle(
// color: Colors.red,
// fontSize: 25,
// fontWeight: FontWeight.w500,
// ),
// )
// ],
// ),
// ),
// ),
// ),
// ),
// ],
// )
