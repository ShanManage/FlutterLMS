import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomFormField.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/auth/signInViewModel.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueGrey[50],
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: blockHeight * 15,
                ),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      Image.asset("assets/splash.png", width: blockWidth * 90),
                      SizedBox(height: blockHeight * 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 12.5,
                        ),
                        child: Column(
                          children: [
                            CustomFormField(
                              fillColor: Colors.deepPurple[100],
                              hintText: "username",
                              isPass: false,
                              fieldController: model.userNameController,
                              prefixIcon: Icons.person,
                            ),
                            SizedBox(height: blockHeight * 2.5),
                            CustomFormField(
                              fillColor: Colors.deepPurple[100],
                              hintText: "password",
                              isPass: true,
                              fieldController: model.passController,
                              prefixIcon: Icons.lock,
                            ),
                            SizedBox(height: blockHeight * 2.5),
                            CustomButton(
                              title: "Log In",
                              bgColor: Colors.deepPurple[400],
                              textColor: Colors.white,
                              callback: () {
                                model.onClickSignIn();
                              },
                            ),
                            (model.isLoading == true)
                                ? CustomLoading()
                                : Container(),
                            SizedBox(height: blockHeight * 2.5),
                            (model.isError == true)
                                ? CustomText(
                                    text: model.error,
                                    color: Colors.red,
                                    size: blockWidth * 4,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
