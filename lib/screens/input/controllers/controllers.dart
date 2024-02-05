import 'package:flutter/material.dart';

class InputControllers {
  late TextEditingController nameController;
  late TextEditingController genderController;
  late TextEditingController heightController;
  late TextEditingController weightController;

  InputControllers() {
    nameController = TextEditingController();
    genderController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
  }
}
