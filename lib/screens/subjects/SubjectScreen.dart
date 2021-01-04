import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomSubjectDocCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/DocumentListScreen.dart';
import 'package:LoginSample/screens/subjects/PDF/PDFViewScreen.dart';
import 'package:LoginSample/screens/subjects/Video/VideoViewScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  Subject subject = new Subject();
  SubjectScreen({@required this.subject});

  final AuthService _auth = AuthService();
  UploadDocument ud = new UploadDocument();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: CustomAppbar(
                  title: subject.subjectName,
                  callbackTail: () async {
                    await _auth.signOut();
                  },
                  callbackHead: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: blockHeight * 22.5),
                child: (this.subject.pdfList.isEmpty &&
                        this.subject.audioList.isEmpty &&
                        this.subject.lmsList.isEmpty &&
                        this.subject.videoList.isEmpty)
                    ? Container(
                        child: CustomNotificationCard(
                          title: "No resluts found for " +
                              this.subject.subjectName,
                        ),
                      )
                    : Column(
                        children: [
                          (this.subject.pdfList.isNotEmpty)
                              ? CustomSubjectDocCard(
                                  title: "PDF",
                                  cardIcon: Icons.picture_as_pdf,
                                  callback: () {
                                    onClickPDF(context);
                                  },
                                )
                              : Container(),
                          (this.subject.videoList.isNotEmpty)
                              ? CustomSubjectDocCard(
                                  title: "Video",
                                  cardIcon: Icons.video_collection,
                                  callback: () {
                                    onClickVideo(context);
                                  },
                                )
                              : Container(),
                          (this.subject.audioList.isNotEmpty)
                              ? CustomSubjectDocCard(
                                  title: "Audio",
                                  cardIcon: Icons.audiotrack,
                                  callback: () {
                                    onClickAudio(context);
                                  },
                                )
                              : Container(),
                          (this.subject.lmsList.isNotEmpty)
                              ? CustomSubjectDocCard(
                                  title: "LMS",
                                  cardIcon: Icons.picture_as_pdf,
                                  callback: () {
                                    onClickLMS(context);
                                  },
                                )
                              : Container(),
                        ],
                      ),
              ),
            ],
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
