import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  Subject subject = new Subject();
  SubjectScreen({@required this.subject});

  @override
  Widget build(BuildContext context) {
    print(subject.subjectName);
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: SingleChildScrollView(
          child: Container(
            child: Text(subject.subjectName),
          ),
        ),
      ),
    );
  }
}
