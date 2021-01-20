import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomSubjectDocCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/Audio/AudioViewScreen.dart';
import 'package:LoginSample/screens/subjects/DocumentListScreen.dart';
import 'package:LoginSample/screens/subjects/PDF/PDFViewScreen.dart';
import 'package:LoginSample/screens/subjects/Video/VideoViewScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            child: Column(
          children: [
            CustomAppbar(
              title: subject.subjectName,
              callbackTail: () async {
                await _auth.signOut();
              },
              callbackHead: () {
                Get.back();
              },
            ),
            Container(
              margin: EdgeInsets.only(top: blockHeight * 0.5),
              child: (this.subject.pdfList.isEmpty &&
                      this.subject.audioList.isEmpty &&
                      this.subject.lmsList.isEmpty &&
                      this.subject.videoList.isEmpty)
                  ? Container(
                      child: CustomNotificationCard(
                        title:
                            "No resluts found for " + this.subject.subjectName,
                      ),
                    )
                  : Column(
                      children: [
                        (this.subject.pdfList.isNotEmpty)
                            ? CustomSubjectDocCard(
                                title: "PDF",
                                imagePath: "assets/icons/pdf.png",
                                callback: () {
                                  onClickPDF(context);
                                },
                              )
                            : Container(),
                        (this.subject.videoList.isNotEmpty)
                            ? CustomSubjectDocCard(
                                title: "Video",
                                imagePath: "assets/icons/video.png",
                                callback: () {
                                  onClickVideo(context);
                                },
                              )
                            : Container(),
                        (this.subject.audioList.isNotEmpty)
                            ? CustomSubjectDocCard(
                                title: "Audio",
                                imagePath: "assets/icons/audio.png",
                                callback: () {
                                  onClickAudio(context);
                                },
                              )
                            : Container(),
                        (this.subject.lmsList.isNotEmpty)
                            ? CustomSubjectDocCard(
                                title: "LMS",
                                imagePath: "assets/icons/lms.png",
                                callback: () {
                                  onClickLMS(context);
                                },
                              )
                            : Container(),
                      ],
                    ),
            ),
          ],
        )),
      ),
    );
  }

  void onClickPDF(BuildContext context) {
    Get.to(
      DocumentListScreen(
        docList: this.subject.pdfList,
        appBarTitle: "PDF",
        defaultThumbnail: "assets/thumbnails/pdf.png",
        ud: this.ud,
        callback: () {
          Get.to(PDFViewScreen(ud: this.ud));
        },
      ),
    );
  }

  void onClickVideo(BuildContext context) {
    Get.to(
      DocumentListScreen(
        docList: this.subject.videoList,
        appBarTitle: "Video",
        defaultThumbnail: "assets/thumbnails/video.png",
        ud: this.ud,
        callback: () {
          Get.to(VideoViewScreen(ud: this.ud));
        },
      ),
    );
  }

  void onClickLMS(BuildContext context) {
    Get.to(
      DocumentListScreen(
        docList: this.subject.lmsList,
        appBarTitle: "LMS",
        defaultThumbnail: "assets/thumbnails/lms.png",
        ud: this.ud,
        callback: () {
          Get.to(PDFViewScreen(ud: this.ud));
        },
      ),
    );
  }

  void onClickAudio(BuildContext context) {
    Get.to(
      DocumentListScreen(
        docList: this.subject.audioList,
        appBarTitle: "Audio",
        defaultThumbnail: "assets/thumbnails/audio.png",
        ud: this.ud,
        callback: () {
          Get.to(AudioViewScreen(ud: this.ud));
        },
      ),
    );
  }
}
