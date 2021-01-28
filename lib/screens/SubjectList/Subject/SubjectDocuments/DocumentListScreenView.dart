import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomAppbar.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomDocCard.dart';
import 'package:LoginSample/screens/SubjectList/Subject/SubjectDocuments/DocumentListScreenViewModel.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class DocumentListScreen extends StatelessWidget {
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

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocumentListScreenViewModel>.reactive(
      viewModelBuilder: () => DocumentListScreenViewModel(),
      onModelReady: (model) {
        model.ud = this.ud;
        model.callback = this.callback;
      },
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blueGrey[50],
            body: Container(
              child: Column(
                children: [
                  CustomAppbar(
                    title: appBarTitle,
                    callbackTail: () async {
                      await model.authService.signOut();
                    },
                    callbackHead: () {
                      Get.back();
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
                              for (var doc in docList)
                                CustomDocCard(
                                  title: doc["title"],
                                  thumbnailURL: doc["thumbnail"],
                                  defaultThumbnail: defaultThumbnail,
                                  callback: () {
                                    model.documentViewCallback(doc);
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
      },
    );
  }
}
