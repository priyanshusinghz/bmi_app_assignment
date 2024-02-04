import 'package:flutter/material.dart';
import 'package:zignuts_assignment/data/user.dart';
import 'package:zignuts_assignment/screens/home/chart.dart';
import 'package:zignuts_assignment/utils/constants.dart';

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
      backgroundColor: myCustomColor,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                        child:
                            Image(image: AssetImage("assets/images/pic.jpg"))),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Priyanshu Singh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(
                    context, '/history'); // Navigate to history page
              },
            ),
            // Add more options as needed
          ],
        ),
      ),
      appBar: AppBar(
        title: Title(color: Colors.greenAccent, child: Text("BMI")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your BMI is..',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              bmi.toStringAsFixed(2),
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            BarGraphWidget(
              historyData: [
                {'weight': '150', 'date': '2024-01-01'},
                {'weight': '155', 'date': '2024-01-05'},
                {'weight': '160', 'date': '2024-01-10'},
              ],
            ),
          ],
        ),
      ),
    );
  }
}
