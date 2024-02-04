import 'package:flutter/material.dart';
import 'package:zignuts_assignment/data/user.dart';
import 'package:zignuts_assignment/screens/history/history.dart';
import 'package:zignuts_assignment/screens/home/home_screen.dart';
import 'package:zignuts_assignment/screens/input/input_page.dart';
import 'package:zignuts_assignment/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      routes: {
        '/': (context) => const SplashScreen(),
        '/input': (context) => InputPage(),
        '/history': (context) => History(),
        '/home': (context) => HomeScreen(
                user: User(
              name: 'Priyanshu Singh',
              gender: 'Male',
              height: 175,
              weight: 70,
              date: DateTime.now(),
            )),
      },
    );
  }
}
