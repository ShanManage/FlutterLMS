import 'package:LoginSample/screens/CostomWidgets/CustomButton.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  String grade = '';

  // final emailController = TextEditingController();
  // final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('sign up for app'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign in"),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Please enter email" : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? "Please enter password 6+ char long"
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "Please select grade" : null,
                  onChanged: (val) {
                    setState(() => grade = val);
                  },
                  decoration: InputDecoration(
                      labelText: 'select', border: OutlineInputBorder()),
                ),
                // DropdownButton<String>(
                //   value: grade,
                //   icon: Icon(Icons.arrow_downward),
                //   iconSize: 24,
                //   elevation: 16,
                //   style: TextStyle(color: Colors.deepPurple),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String newValue) {
                //     setState(() {
                //       grade = newValue;
                //     });
                //   },
                //   items: <String>['six', 'seven', 'eight', 'nine']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
                SizedBox(height: 20.0),
                CustomButton(
                  title: "Sign Up",
                  bgColor: Colors.green[200],
                  textColor: Colors.black,
                  callback: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password, grade);
                      print(result);
                      // if (result == null) {
                      //   setState(() => error = 'Please enter valid Email.!');
                      // }
                    }
                  },
                ),
                // RaisedButton(
                //     color: Colors.pink[400],
                //     child: Text(
                //       "Sign up",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     onPressed: () async {
                //       if (_formKey.currentState.validate()) {
                //         dynamic result =
                //             await _auth.registerWithEmailAndPassword(
                //                 email, password, grade);
                //         print(result);
                //         // if (result == null) {
                //         //   setState(() => error = 'Please enter valid Email.!');
                //         // }
                //       }
                //     }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )),
    );
  }
}
