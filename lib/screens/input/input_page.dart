import 'package:flutter/material.dart';
import 'package:zignuts_assignment/controllers/controllers.dart';
import 'package:zignuts_assignment/data/user.dart';
import 'package:zignuts_assignment/utils/constants.dart';
import 'package:zignuts_assignment/widgets/reusable_widgets.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late InputControllers inputControllers;

  @override
  void initState() {
    super.initState();
    inputControllers = InputControllers();
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
          ),
          CustomTextField(
            name: 'Gender',
            controller: inputControllers.genderController,
          ),
          CustomTextField(
            name: 'Height',
            controller: inputControllers.heightController,
          ),
          CustomTextField(
            name: 'Weight',
            controller: inputControllers.weightController,
          ),
          ElevatedButton(
            onPressed: () {
              String name = inputControllers.nameController.text;
              String gender = inputControllers.genderController.text;
              double height =
                  double.parse(inputControllers.heightController.text);
              double weight =
                  double.parse(inputControllers.weightController.text);

              User user = User(
                name: name,
                gender: gender,
                height: height,
                weight: weight,
                date: DateTime.now(),
              );

              Navigator.pushNamed(context, '/home', arguments: user);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
