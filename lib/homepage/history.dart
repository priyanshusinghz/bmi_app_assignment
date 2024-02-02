import 'package:flutter/material.dart';

class History extends StatefulWidget {
  
    History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            width: MediaQuery.of(context).size.width,
            
            
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
            child: Column(
              children: [
                Text(DateTime.now().toString()),
                Text("18"),
              ],
            ),
          )
          
        ]),
      ),
    );
  }
}