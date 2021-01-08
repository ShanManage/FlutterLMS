import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDocCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DocumentListScreen extends StatefulWidget {
  List<dynamic> docList = new List();
  String appBarTitle, defaultThumbnail;
  VoidCallback callback;
  UploadDocument ud;
  DocumentListScreen(
      {@required this.docList,
      @required this.appBarTitle,
      @required this.callback,
      @required this.defaultThumbnail,
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
                width: double.infinity,
                height: blockHeight * 80,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: blockHeight * 0.5),
                      child: Wrap(
                        spacing: blockWidth * 5,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: [
                          for (var doc in this.widget.docList)
                            CustomDocCard(
                              title: doc["title"],
                              thumbnailURL: (doc["thumbnail"] != null)
                                  ? doc["thumbnail"]
                                  : this.widget.defaultThumbnail,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
