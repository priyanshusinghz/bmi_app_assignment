import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.name,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: name,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onSubmitted: (value) {
          if (value.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please fill in all details.'),
              ),
            );
          }
        },
      ),
    );
  }
}
