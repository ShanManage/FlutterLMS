import 'package:LoginSample/models/User.dart';
import 'package:LoginSample/screens/admin/adminScreean.dart';
import 'package:LoginSample/screens/wrapper.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/admin': (context) => AdminScreen(),
        },
      ),
    );
  }
}
