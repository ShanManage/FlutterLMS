import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String hintText;
  bool isPass;
  TextEditingController fieldController;
  IconData prefixIcon;
  TextInputType inputType;
  Color fillColor;

  CustomFormField(
      {@required this.hintText,
      @required this.isPass,
      @required this.fieldController,
      @required this.prefixIcon,
      this.fillColor,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: fieldController,
        obscureText: isPass,
        validator: (isPass == true) ? validatePass : null,
        keyboardType: (inputType == null) ? TextInputType.text : inputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50.0),
          ),
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          filled: true,
          fillColor: (fillColor == null) ? Colors.green[50] : fillColor,
          border: InputBorder.none,
        ),
      ),
    );
  }

  String validatePass(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    } else {
      return null;
    }
  }
}
