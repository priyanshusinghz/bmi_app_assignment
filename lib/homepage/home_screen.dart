import 'package:flutter/material.dart';
import 'package:zignuts_assignment/data/user.dart';
import 'package:zignuts_assignment/homepage/chart.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  HomeScreen({required this.user});

  double calculateBMI() {
    if (user.height > 0 && user.weight > 0) {
      return user.weight / ((user.height / 100) * (user.height / 100));
    } else {
      return 0.0;
    }
  }
   

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pushNamed(context,'/history');
        }, icon: Icon(Icons.person_2))],
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'BMI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              bmi.toStringAsFixed(2),
              style:  TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            BarGraph(),
          ],
        ),
      ),
    );
  }
}
