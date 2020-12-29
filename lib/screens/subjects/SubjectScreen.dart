import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/screens/subjects/Audio/AudioListScree.dart';
import 'package:LoginSample/screens/subjects/LMS/LMSListScreen.dart';
import 'package:LoginSample/screens/subjects/PDF/PDFLIstScreen.dart';
import 'package:LoginSample/screens/subjects/Video/VideoListScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatelessWidget {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;
  final AuthService _auth = AuthService();

  Subject subject = new Subject();
  SubjectScreen({@required this.subject});

  @override
  Widget build(BuildContext context) {
    print(subject.subjectName);
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
            child: Column(
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
        builder: (context) => PDFListScreen(pdfList: this.subject.pdfList),
      ),
    );
  }

  void onClickVideo(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            VideoListScreen(videoList: this.subject.videoList),
      ),
    );
  }

  void onClickLMS(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LMSListScreen(lmsList: this.subject.lmsList),
      ),
    );
  }

  void onClickAudio(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AudioListScreen(audioList: this.subject.audioList),
      ),
    );
  }
}
