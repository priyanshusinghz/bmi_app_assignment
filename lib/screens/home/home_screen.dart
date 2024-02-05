import 'package:flutter/material.dart';
import 'package:zignuts_assignment/data/database_helper.dart';
import 'package:zignuts_assignment/screens/home/drawer.dart';
import 'package:zignuts_assignment/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  double calculateBMI(User user) {
    if (user.height > 0 && user.weight > 0) {
      return user.weight / ((user.height / 100) * (user.height / 100));
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: DatabaseHelper().getLatestUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('No user data found');
        } else {
          User user = snapshot.data!;
          double bmi = calculateBMI(user);

          return Scaffold(
            backgroundColor: myCustomColor,
            drawer: myDrawer(),
            appBar: AppBar(
              title: Title(color: Colors.greenAccent, child: const Text("BMI")),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello, ${user.name}!', // Show the username
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your BMI is..',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
