import 'package:flutter/material.dart';
import 'package:zignuts_assignment/data/user.dart';
import 'package:zignuts_assignment/homepage/history.dart';
import 'package:zignuts_assignment/homepage/home_screen.dart';
import 'package:zignuts_assignment/homepage/input_page.dart';
import 'package:zignuts_assignment/splash_screen.dart';

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
      initialRoute: '/',
      routes: {
    
    '/': (context) => const SplashScreen(),
    '/input': (context) =>  InputPage(),
    '/history': (context) =>  History(),
    '/home': (context) =>   HomeScreen(user: User(
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
