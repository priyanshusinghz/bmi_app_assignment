import 'package:flutter/material.dart';
import 'package:zignuts_assignment/screens/input/controllers/controllers.dart';
import 'package:zignuts_assignment/data/database_helper.dart';
import 'package:zignuts_assignment/utils/constants.dart';
import 'package:zignuts_assignment/screens/input/custom_textfield.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? keimport 'package:flutter/material.dart';
import 'package:zignuts_assignment/screens/input/controllers/controllers.dart';
import 'package:zignuts_assignment/data/database_helper.dart';
import 'package:zignuts_assignment/utils/constants.dart';
import 'package:zignuts_assignment/screens/input/custom_textfield.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late InputControllers inputControllers;
  String selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    inputControllers = InputControllers();
  }

  bool areFieldsEmpty() {
    return inputControllers.nameController.text.isEmpty ||
        inputControllers.heightController.text.isEmpty ||
        inputControllers.weightController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myCustomColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            name: 'Name',
            controller: inputControllers.nameController,
            keyboardType: TextInputType.name,
          ),
          Row(
            children: [
              Radio(
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                  });
                },
              ),
              const Text('Male'),
              Radio(
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                  });
                },
              ),
              const Text('Female'),
            ],
          ),
          CustomTextField(
            name: 'Height',
            controller: inputControllers.heightController,
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            name: 'Weight',
            controller: inputControllers.weightController,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () async {
              if (areFieldsEmpty()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill in all details.'),
                  ),
                );
              } else {
                String name = inputControllers.nameController.text;
                int height = int.parse(inputControllers.heightController.text);
                int weight = int.parse(inputControllers.weightController.text);

                User user = User(
                  name: name,
                  gender: selectedGender, // Use selected gender
                  height: height,
                  weight: weight,
                  date: DateTime.now(),
                );

                await DatabaseHelper().insertUser(user);

                Navigator.pushNamed(context, '/home', arguments: user);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
y}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late InputControllers inputControllers;
  String selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    inputControllers = InputControllers();
  }

  bool areFieldsEmpty() {
    return inputControllers.nameController.text.isEmpty ||
        inputControllers.heightController.text.isEmpty ||
        inputControllers.weightController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myCustomColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            name: 'Name',
            controller: inputControllers.nameController,
            keyboardType: TextInputType.name,
          ),
          Row(
            children: [
              Radio(
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                  });
                },
              ),
              const Text('Male'),
              Radio(
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value.toString();
                  });
                },
              ),
              const Text('Female'),
            ],
          ),
          CustomTextField(
            name: 'Height',
            controller: inputControllers.heightController,
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            name: 'Weight',
            controller: inputControllers.weightController,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () async {
              if (areFieldsEmpty()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill in all details.'),
                  ),
                );
              } else {
                String name = inputControllers.nameController.text;
                int height = int.parse(inputControllers.heightController.text);
                int weight = int.parse(inputControllers.weightController.text);

                User user = User(
                  name: name,
                  gender: selectedGender, // Use selected gender
                  height: height,
                  weight: weight,
                  date: DateTime.now(),
                );

                await DatabaseHelper().insertUser(user);

                Navigator.pushNamed(context, '/home', arguments: user);
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
