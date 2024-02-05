import 'package:flutter/material.dart';
import 'package:zignuts_assignment/controllers/controllers.dart';
import 'package:zignuts_assignment/data/database_helper.dart';
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
            controller: inputControllers.nameController, keyboardType: TextInputType.name,
          ),
          CustomTextField(
            name: 'Gender',
            controller: inputControllers.genderController,
            keyboardType: TextInputType.text,
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
              String name = inputControllers.nameController.text;
              String gender = inputControllers.genderController.text;
              int height =
                  int.parse(inputControllers.heightController.text);
              int weight =
                  int.parse(inputControllers.weightController.text);

              User user = User(
                name: name,
                gender: gender,
                height: height,
                weight: weight,
                date: DateTime.now(),
              );

              await DatabaseHelper().insertUser(user);

              Navigator.pushNamed(context, '/home', arguments: user);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
