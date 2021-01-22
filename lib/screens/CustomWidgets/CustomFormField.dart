import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
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
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isHide = false;

  @override
  void initState() {
    if (this.widget.isPass == true) {
      isHide = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: this.widget.fieldController,
        obscureText: (isHide == true) ? true : false,
        validator: validatePass,
        keyboardType: (this.widget.inputType == null)
            ? TextInputType.text
            : this.widget.inputType,
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
          prefixIcon: Icon(this.widget.prefixIcon),
          suffixIcon: (this.widget.isPass == true)
              ? IconButton(
                  icon: Icon(
                    (isHide == true) ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () { 
                    setState(() {
                      isHide = !isHide;
                    });
                  })
              : null,
          hintText: this.widget.hintText,
          filled: true,
          fillColor: (this.widget.fillColor == null)
              ? Colors.white
              : this.widget.fillColor,
          border: InputBorder.none,
        ),
      ),
    );
  }

  String validatePass(String value) {
    dynamic error;
    if (value.isEmpty) {
      if (this.widget.isPass) {
        error = "Password can't be empty";
      } else
        error = "User name can't be empty";
    } else {
      error = null;
    }
    return error;
  }
}
