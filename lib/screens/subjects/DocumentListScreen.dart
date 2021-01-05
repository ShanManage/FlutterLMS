import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDocCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DocumentListScreen extends StatefulWidget {
  List<dynamic> docList = new List();
  String appBarTitle;
  VoidCallback callback;
  UploadDocument ud;
  DocumentListScreen(
      {@required this.docList,
      @required this.appBarTitle,
      @required this.callback,
      this.ud});
  @override
  _DocumentListScreenState createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Container(
          color: Colors.blueGrey[50],
          child: Column(
            children: [
              CustomAppbar(
                title: this.widget.appBarTitle,
                callbackTail: () async {
                  await _auth.signOut();
                },
                callbackHead: () {
                  Navigator.of(context).pop();
                },
              ),
              Container(
                height: blockHeight * 77.5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    margin: EdgeInsets.only(top: blockHeight * 2.5),
                    child: Wrap(
                      spacing: blockWidth * 5,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      children: [
                        for (var doc in this.widget.docList)
                          CustomDocCard(
                            title: doc["title"],
                            thumbnailURL: doc["thumbnail"],
                            callback: () {
                              this.widget.ud.docType =
                                  this.widget.ud.docURL = doc["url"];
                              this.widget.ud.title = doc["title"];
                              this.widget.ud.thumbnailURL = doc["thumbnail"];
                              this.widget.callback();
                            },
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
