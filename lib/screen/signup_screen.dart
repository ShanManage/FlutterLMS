

import 'package:emaster/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authonication.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName ='/signup';
  
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

final GlobalKey<FormState> _formKey =  GlobalKey();
TextEditingController _passwordController = new TextEditingController();
Map<String, String> _authData = {
  'email' : '',
  'password' : ''
};


 void _showErrorDialog(String msg){
   showDialog(
     context: context,
     builder: (ctx) => AlertDialog(
       title: Text('An Error Occured'),
       content: Text(msg),
       actions: <Widget>[
         FlatButton(
           child: Text('Ok'),
           onPressed: (){
             Navigator.of(ctx).pop();
           },
           )
       ],
     )
     );
 }

Future<void> _submit() async
{
 if(!_formKey.currentState.validate()){
   return;
 }
 _formKey.currentState.save();

 try{
 await Provider.of<Authonication>(context, listen: false).signUp( 
   _authData['email'],
    _authData['password']
    );
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
 }catch(error){
    var errorMessage = 'Authentication failed, Plesase try again later.!';
    _showErrorDialog(errorMessage);
 }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Master'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: [
                Text('Sign-In'),
                Icon(Icons.person),
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
        backgroundColor: Colors.green[800],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                    Colors.green,
                    Colors.green,
              ])
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.blue[50],
              child: Container(
                height: 350,
                width: 300,
                padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      //email Text box and validation
                      TextFormField(
                        
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            
                          ),
                          ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value)
                        {
                          if(value.isEmpty || !value.contains('@'))
                          {
                            return 'Invalid Email';
                          }
                           return null;
                        },
                        onSaved: (value)
                        {
                            _authData['email'] = value;
                        },
                      ),
                    SizedBox(
                        height: 10,
                      ),


                    //password
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        ),
                      obscureText: true,
                      controller: _passwordController,
                       validator: (value)
                        {
                          if(value.isEmpty || value != _passwordController.text)
                          {
                            return 'Invalid Password';
                          }
                           return null;
                        },
                       onSaved: (value)
                        {
                          _authData['password'] = value;   
                        }, 
                    ),

                  SizedBox(
                        height: 10,
                      ),
                  //Confirm password
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                        ),
                      obscureText: true,
                       validator: (value)
                        {
                          if(value.isEmpty || value.length<=5)
                          {
                            return 'Invalid Password';
                          }
                           return null;
                        },
                       onSaved: (value)
                        {

                        }, 
                    ),


                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      child: Text
                      ('Submit'),
                      onPressed: ()
                      {
                        _submit();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    )
                    ],
                  ),
                ),
              ),
              ),
            ),
          )
          
        ],
      ),
    );
  }
}