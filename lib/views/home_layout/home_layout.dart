import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/view_models/app_view_model.dart';
import 'package:todo_project/views/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_project/views/profile_screen.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "homeLayout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: const Text(
              "Welcome, Esraa",
              style: TextStyle(
                fontSize: 26,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
                icon: const Icon(
                  Icons.person_outline,
                  size: 30,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              viewModel.showBottomSheet(AddTaskBottomSheet(), context);
            },
            backgroundColor: const Color(0xFFD1E8FF),
            shape: const StadiumBorder(
              side: BorderSide(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 15,
            shape: const CircularNotchedRectangle(),
            color: Colors.white,
            child: BottomNavigationBar(
              iconSize: 30,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: viewModel.bottomNavIndex,
              onTap: (value) {
                viewModel.changeBottomNavIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.my_library_books_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.task_outlined,
                    ),
                    label: "")
              ],
            ),
          ),
          body: viewModel.tabs[viewModel.bottomNavIndex],
        );
      },
    );
  }
}
