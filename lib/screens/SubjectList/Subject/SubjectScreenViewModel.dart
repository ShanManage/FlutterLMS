import 'package:LoginSample/models/Subject.dart';
import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/SubjectList/Subject/SubjectDocuments/Audio/AudioViewScreen.dart';
import 'package:LoginSample/screens/SubjectList/Subject/SubjectDocuments/DocumentListScreenView.dart';
import 'package:LoginSample/screens/SubjectList/Subject/SubjectDocuments/PDF/PDFViewScreen.dart';
import 'package:LoginSample/screens/SubjectList/Subject/SubjectDocuments/Video/VideoViewScreen.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectScreenViewModel extends ChangeNotifier {
  final AuthService authService = AuthService();
  UploadDocument ud = new UploadDocument();
  Subject subjectModel = new Subject();

  onClickPDF() {
    Get.to(
      DocumentListScreen(
        docList: subjectModel.pdfList,
        appBarTitle: "PDF",
        defaultThumbnail: "assets/thumbnails/pdf.png",
        ud: this.ud,
        callback: () {
          Get.to(PDFViewScreen(ud: this.ud));
        },
      ),
    );
  }

  onClickVideo() {
    Get.to(
      DocumentListScreen(
        docList: subjectModel.videoList,
        appBarTitle: "Video",
        defaultThumbnail: "assets/thumbnails/video.png",
        ud: this.ud,
        callback: () {
          Get.to(VideoViewScreen(ud: this.ud));
        },
      ),
    );
  }

  onClickLMS() {
    Get.to(
      DocumentListScreen(
        docList: subjectModel.lmsList,
        appBarTitle: "LMS",
        defaultThumbnail: "assets/thumbnails/lms.png",
        ud: this.ud,
        callback: () {
          Get.to(PDFViewScreen(ud: this.ud));
        },
      ),
    );
  }

  onClickAudio() {
    Get.to(
      DocumentListScreen(
        docList: subjectModel.audioList,
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
