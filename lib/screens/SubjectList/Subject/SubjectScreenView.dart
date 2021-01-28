import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomNotificationCard.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomSubjectDocCard.dart';
import 'package:LoginSample/screens/SubjectList/Subject/SubjectScreenViewModel.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class SubjectScreen extends StatelessWidget {
  Subject subject = new Subject();
  SubjectScreen({@required this.subject});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubjectScreenViewModel>.reactive(
      viewModelBuilder: () => SubjectScreenViewModel(),
      onModelReady: (model) {
        model.subjectModel = this.subject;
      },
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueGrey[50],
            body: SingleChildScrollView(
                child: Column(
              children: [
                CustomAppbar(
                  title: subject.subjectName,
                  callbackTail: () async {
                    await model.authService.signOut();
                  },
                  callbackHead: () {
                    Get.back();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: blockHeight * 0.5),
                  child: (model.subjectModel.pdfList.isEmpty &&
                          model.subjectModel.audioList.isEmpty &&
                          model.subjectModel.lmsList.isEmpty &&
                          model.subjectModel.videoList.isEmpty)
                      ? Container(
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              CustomNotificationCard(
                                title: "No resluts found for " +
                                    model.subjectModel.subjectName,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            (model.subjectModel.pdfList.isNotEmpty)
                                ? CustomSubjectDocCard(
                                    title: "PDF",
                                    imagePath: "assets/icons/pdf.png",
                                    callback: () {
                                      model.onClickPDF();
                                    },
                                  )
                                : Container(),
                            (model.subjectModel.videoList.isNotEmpty)
                                ? CustomSubjectDocCard(
                                    title: "Video",
                                    imagePath: "assets/icons/video.png",
                                    callback: () {
                                      model.onClickVideo();
                                    },
                                  )
                                : Container(),
                            (model.subjectModel.audioList.isNotEmpty)
                                ? CustomSubjectDocCard(
                                    title: "Audio",
                                    imagePath: "assets/icons/audio.png",
                                    callback: () {
                                      model.onClickAudio();
                                    },
                                  )
                                : Container(),
                            (model.subjectModel.lmsList.isNotEmpty)
                                ? CustomSubjectDocCard(
                                    title: "LMS",
                                    imagePath: "assets/icons/lms.png",
                                    callback: () {
                                      model.onClickLMS();
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
      },
    );
  }
}
