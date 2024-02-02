import 'package:flutter/material.dart';

class User {
  final String name;
  final String gender;
  final double height;
  final double weight;
  final DateTime date;

  User({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.date,
  });
}