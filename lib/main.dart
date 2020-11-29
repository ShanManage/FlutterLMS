import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/signup_screen.dart';
import 'models/authonication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: Authonication(),
        )
    ],
    child : MaterialApp(
      title: 'E-Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        SignupScreen.routeName : (ctx)=> SignupScreen(),
        LoginScreen.routeName : (ctx)=> LoginScreen(),
        HomeScreen.routeName : (ctx)=> HomeScreen(),
      },
     ),
  );
  }
}


