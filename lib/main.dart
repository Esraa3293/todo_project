import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/view_models/app_view_model.dart';
import 'package:todo_project/views/edit_task.dart';
import 'package:todo_project/views/home_layout/home_layout.dart';
import 'package:todo_project/views/login_screen.dart';
import 'package:todo_project/views/profile_screen.dart';
import 'package:todo_project/views/sign_up.dart';
import 'package:todo_project/views/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FirebaseFirestore.instance.disableNetwork();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUp.routeName: (context) => SignUp(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        EditTask.routeName: (context) => EditTask(),
        HomeLayout.routeName: (context) => const HomeLayout(),
      },
    );
  }
}
