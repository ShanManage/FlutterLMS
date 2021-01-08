import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/globals.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passController = TextEditingController();

  bool isError = false;
  bool isLoading = false;
  String error = '';

  onClickSignIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
        isError = false;
      });
      dynamic result = await _auth.signInWithEmailAndPassword(
          userNameController.text.trim(), passController.text.trim());
      if (result == null) {
        setState(() {
          error = 'Invalid username or password';
          isLoading = false;
          isError = true;
        });
      }
    }
  }

  @override
  void initState() {
    userNameController.text = '';
    passController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: blockHeight * 20, horizontal: blockWidth * 12.5),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      fillColor: Colors.deepPurple[100],
                      hintText: "username",
                      isPass: false,
                      fieldController: userNameController,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: blockHeight * 2.5),
                    CustomFormField(
                      fillColor: Colors.deepPurple[100],
                      hintText: "password",
                      isPass: true,
                      fieldController: passController,
                      prefixIcon: Icons.lock,
                    ),
                    SizedBox(height: blockHeight * 2.5),
                    CustomButton(
                      title: "Log In",
                      bgColor: Colors.deepPurple[400],
                      textColor: Colors.white,
                      callback: () {
                        onClickSignIn();
                      },
                    ),
                    (isLoading == true) ? CustomLoading() : Container(),
                    SizedBox(height: blockHeight * 2.5),
                    (isError == true)
                        ? CustomText(
                            text: error,
                            color: Colors.red,
                            size: blockWidth * 4,
                          )
                        : Container(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
