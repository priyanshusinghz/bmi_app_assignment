


import 'package:flutter/material.dart';
import 'package:zignuts_assignment/homepage/input_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
    Duration(seconds: 4),
    (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>InputPage()));
    }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
        // Box decoration takes a gradient
        color: Colors.white
      ),
      
        child: Container(
          height: 140,
          width: 140,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(image: AssetImage('assets/images/bmi.png'))),
        ),
      ),
    );
  }
}