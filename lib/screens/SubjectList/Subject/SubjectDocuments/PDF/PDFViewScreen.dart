import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PDFViewScreen extends StatefulWidget {
  UploadDocument ud;
  PDFViewScreen({@required this.ud});
  @override
  _PDFViewScreenState createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  int page = 0, total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(
            left: blockWidth * 2.5,
            right: blockWidth * 2.5,
            bottom: blockHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: blockHeight),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: blockHeight * 0.5,
                      vertical: blockHeight * 0.5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      size: blockHeight * 5,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(height: blockHeight),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: blockHeight * 0.25,
                ),
                SizedBox(height: blockHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Expanded(
                        child: CustomText(
                          text: this.widget.ud.title.toString(),
                          color: Colors.black,
                          weight: FontWeight.w300,
                          size: blockWidth * 5,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(blockWidth * 4),
                      child: CustomText(
                        text: page.toString() + "/" + total.toString(),
                        color: Colors.black,
                        weight: FontWeight.w500,
                        size: blockWidth * 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: blockHeight),
                Container(
                  color: Colors.blueGrey[50],
                  height: blockHeight * 77.5,
                  child: PDF(
                    autoSpacing: false,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    pageFling: false,
                    onPageChanged: (int page, int total) {
                      setState(() {
                        this.page = page + 1;
                        this.total = total;
                      });
                    },
                  ).fromUrl(
                    this.widget.ud.docURL,
                    placeholder: (double progress) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomLoading(),
                        Text('$progress %'),
                      ],
                    ),
                    errorWidget: (dynamic error) => Center(
                      child: CustomText(
                        text:
                            "Error while downloading the pdf.. please reload again.  " +
                                error.toString(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: blockHeight),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: blockHeight * 0.25,
                ),
                SizedBox(height: blockHeight),
                Center(
                  child: CustomText(
                    text: "Please swap to turn pages",
                    color: Colors.black,
                    size: blockWidth * 3.5,
                    weight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
