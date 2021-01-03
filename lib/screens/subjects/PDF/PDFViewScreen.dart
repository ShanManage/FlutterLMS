import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomLoading.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewScreen extends StatefulWidget {
  UploadDocument ud;
  PDFViewScreen({@required this.ud});
  @override
  _PDFViewScreenState createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  final AuthService _auth = AuthService();

  int page = 0, total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: this.widget.ud.title,
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
        body: Column(
          children: [
            SizedBox(height: blockHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black,
                  child: CustomText(
                    text: this.widget.ud.title.toString() +
                        " asdasd asdasd asdasd asdasd asdasd",
                    color: Colors.white,
                    weight: FontWeight.w300,
                    size: blockWidth * 5,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[500],
                  ),
                  child: CustomText(
                    text: page.toString() + "/" + total.toString(),
                    color: Colors.white,
                    weight: FontWeight.w500,
                    size: blockWidth * 5,
                  ),
                ),
              ],
            ),
            Container(
              height: blockHeight * 80,
              child: PDF(
                autoSpacing: false,
                enableSwipe: true,
                swipeHorizontal: true,
                pageFling: false,
                fitPolicy: FitPolicy.BOTH,
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
          ],
        ),
      ),
    );
  }
}
