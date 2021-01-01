import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
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

  String error = '';

  onClickSignIn() async {
    if (_formKey.currentState.validate()) {
      await _auth.signInWithEmailAndPassword(
          userNameController.text, passController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: CustomText(text: "Sign In for LMS"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: blockHeight * 20, horizontal: blockWidth * 12.5),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      hintText: "username",
                      isPass: false,
                      fieldController: userNameController,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: blockHeight * 2.5),
                    CustomFormField(
                      hintText: "password",
                      isPass: true,
                      fieldController: passController,
                      prefixIcon: Icons.lock,
                    ),
                    SizedBox(height: blockHeight * 2.5),
                    CustomButton(
                      title: "Log In",
                      bgColor: Colors.green[400],
                      textColor: Colors.black,
                      callback: () {
                        onClickSignIn();
                      },
                    ),
                    // Text(
                    //   error,
                    //   style: TextStyle(color: Colors.red, fontSize: 14.0),
                    // )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
