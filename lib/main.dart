import 'package:LoginSample/models/User.dart';
import 'package:LoginSample/screens/admin/AdminScreean.dart';
import 'package:LoginSample/screens/wrapper.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser>.value(
      value: AuthService().user,
      child: GetMaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/admin': (context) => AdminScreen(),
        },
      ),
    );
  }
}
