import 'package:LoginSample/screens/CostomWidgets/CostomText.dart';
import 'package:LoginSample/screens/CostomWidgets/CustomCard.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:LoginSample/services/auth.dart';
import 'package:flutter/material.dart';

class AudioListScreen extends StatelessWidget {
  List<dynamic> audioList = new List();
  AudioListScreen({@required this.audioList});

  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Audio",
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
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: loadAudios(),
          ),
        ),
      ),
    );
  }

  loadAudios() {
    return audioList
        .map((audio) => CustomCard(title: audio["title"], callback: () {}))
        .toList();
  }
}
