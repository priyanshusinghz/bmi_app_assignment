import 'package:flutter/material.dart';
import 'package:zignuts_assignment/data/database_helper.dart';
import 'package:zignuts_assignment/screens/history/history.dart';
import 'package:zignuts_assignment/screens/home/home_screen.dart';
import 'package:zignuts_assignment/screens/input/input_page.dart';
import 'package:zignuts_assignment/screens/splash_screen.dart';

void main() async{
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/input': (context) => InputPage(),
        '/history': (context) => History(),
        '/home': (context) => HomeScreen(
              ),
      },
    );
  }
}
