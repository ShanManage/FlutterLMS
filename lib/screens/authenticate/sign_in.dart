import 'package:LoginSample/screens/CostomWidgets/CostomText.dart';
import 'package:LoginSample/screens/CostomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CostomWidgets/CustomFormField.dart';
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

  onClickSignIn() {
    if (_formKey.currentState.validate()) {
      _auth.signIn(userNameController.text, passController.text);
      // dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      // if (result == null) {
      //   setState(() => error = 'could not sign in with this credential.!');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
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
