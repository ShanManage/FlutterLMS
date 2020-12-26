import 'package:fl_fire_auth/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class HomePageseven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Grade 7'),
      ),
      body: MyStatelessWidget()
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: const Text('LMS', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: const Text('Video Tutorial', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: const Text('Model Papers', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: const Text('Past Papers', style: TextStyle(fontSize: 20)),
          ),
          // const SizedBox(height: 30),
          // RaisedButton(
          //   onPressed: () {},
          //   textColor: Colors.white,
          //   padding: const EdgeInsets.all(0.0),
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: <Color>[
          //           Color(0xFF0D47A1),
          //           Color(0xFF1976D2),
          //           Color(0xFF42A5F5),
          //         ],
          //       ),
          //     ),
          //     padding: const EdgeInsets.all(10.0),
          //     child:
          //         const Text('Gradient Button', style: TextStyle(fontSize: 20)),
          //   ),
          // ),
          RaisedButton(
              child: Text("Log out"),
              onPressed: () {
                AuthHelper.logOut();
              },
            )
        ],
      ),
    );
  }
}
