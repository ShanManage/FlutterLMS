import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/DocumentListScreen.dart';
import 'package:LoginSample/screens/subjects/PDF/PDFViewScreen.dart';
import 'package:LoginSample/screens/subjects/Video/VideoViewScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubjectScreen extends StatelessWidget {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;
  final AuthService _auth = AuthService();

  Subject subject = new Subject();
  SubjectScreen({@required this.subject});

  UploadDocument ud = new UploadDocument();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: subject.subjectName,
            size: blockWidth * 8,
          ),
          actions: [
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                onPressed: () async {
                  await _auth.signOut();
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: (this.subject.pdfList.isEmpty &&
                    this.subject.audioList.isEmpty &&
                    this.subject.lmsList.isEmpty &&
                    this.subject.videoList.isEmpty)
                ? Container(
                    child: CustomCard(
                      callback: () {},
                      title: "No subjects",
                      height: blockHeight * 30,
                    ),
                  )
                : Column(
                    children: [
                      (this.subject.pdfList.isNotEmpty)
                          ? CustomCard(
                              title: "PDF",
                              callback: () {
                                onClickPDF(context);
                              },
                            )
                          : Container(),
                      (this.subject.videoList.isNotEmpty)
                          ? CustomCard(
                              title: "Video",
                              callback: () {
                                onClickVideo(context);
                              },
                            )
                          : Container(),
                      (this.subject.audioList.isNotEmpty)
                          ? CustomCard(
                              title: "Audio",
                              callback: () {
                                onClickAudio(context);
                              },
                            )
                          : Container(),
                      (this.subject.lmsList.isNotEmpty)
                          ? CustomCard(
                              title: "LMS",
                              callback: () {
                                onClickLMS(context);
                              },
                            )
                          : Container(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void onClickPDF(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DocumentListScreen(
          docList: this.subject.pdfList,
          appBarTitle: "PDF",
          ud: this.ud,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFViewScreen(ud: this.ud),
              ),
            );
          },
        ),
      ),
    );
  }

  void onClickVideo(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DocumentListScreen(
          docList: this.subject.videoList,
          appBarTitle: "Video",
          ud: this.ud,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoViewScreen(ud: this.ud),
              ),
            );
          },
        ),
      ),
    );
  }

  void onClickLMS(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DocumentListScreen(
          docList: this.subject.lmsList,
          appBarTitle: "LMS",
          ud: this.ud,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFViewScreen(ud: this.ud),
              ),
            );
          },
        ),
      ),
    );
  }

  void onClickAudio(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DocumentListScreen(
          docList: this.subject.audioList,
          appBarTitle: "Audio",
          ud: this.ud,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoViewScreen(ud: this.ud),
              ),
            );
          },
        ),
      ),
    );
  }
}
