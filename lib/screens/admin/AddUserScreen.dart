import 'package:LoginSample/models/RegisterStudent.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDropDownList.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passController = TextEditingController();
  RegisterStudent student = new RegisterStudent();

  onClickSignUp() async {
    if (_formKey.currentState.validate()) {
      student.userName = userNameController.text;
      student.password = passController.text;
      await _auth.registerWithEmailAndPassword(student, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    student.registerGrade = _grades.first.value;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            CustomFormField(
              hintText: "username",
              isPass: false,
              fieldController: userNameController,
              prefixIcon: Icons.person,
              fillColor: Colors.brown[50],
            ),
            SizedBox(height: blockHeight * 2.5),
            CustomFormField(
              hintText: "password",
              isPass: true,
              fieldController: passController,
              prefixIcon: Icons.lock,
              fillColor: Colors.brown[50],
            ),
            SizedBox(height: blockHeight * 2.5),
            CustomDropDownList(
              list: _grades,
              lable: "grade",
              type: "rs",
              rs: student,
              fillColor: Colors.brown[50],
            ),
            SizedBox(height: blockHeight * 2.5),
            CustomButton(
              title: "Create",
              bgColor: Colors.green[200],
              textColor: Colors.black,
              callback: () async {
                onClickSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _grades = [
    DropdownMenuItem(
      child: new Text("grade 6"),
      value: "6",
    ),
    DropdownMenuItem(
      child: new Text("grade 7"),
      value: "7",
    ),
    DropdownMenuItem(
      child: new Text("grade 8"),
      value: "8",
    ),
    DropdownMenuItem(
      child: new Text("grade 9"),
      value: "9",
    ),
    DropdownMenuItem(
      child: new Text("grade 10"),
      value: "10",
    ),
    DropdownMenuItem(
      child: new Text("grade 11"),
      value: "11",
    ),
  ];
}
