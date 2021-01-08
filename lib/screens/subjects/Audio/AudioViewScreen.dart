import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AudioViewScreen extends StatefulWidget {
  UploadDocument ud;

  AudioViewScreen({@required this.ud});

  @override
  State<StatefulWidget> createState() {
    return _AudioViewScreen();
  }
}

class _AudioViewScreen extends State<AudioViewScreen> {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;

  VideoPlayerController _videoPlayerController1;
  ChewieAudioController _chewieAudioController;

  @override
  void initState() {
    super.initState();
    this.initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieAudioController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.network(this.widget.ud.docURL.toString());
    await _videoPlayerController1.initialize();
    _chewieAudioController = ChewieAudioController(
      videoPlayerController: _videoPlayerController1,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: blockHeight),
              Container(
                margin: EdgeInsets.all(blockWidth * 2),
                child: Row(
                  children: [
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
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: blockWidth * 5),
                    Expanded(
                      child: CustomText(
                        text: this.widget.ud.title.toString(),
                        color: Colors.black,
                        weight: FontWeight.w300,
                        size: blockWidth * 6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: blockHeight * 5),
              Container(
                margin: EdgeInsets.symmetric(horizontal: blockWidth * 5),
                height: blockHeight * 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (this.widget.ud.thumbnailURL != null)
                        ? NetworkImage(this.widget.ud.thumbnailURL.toString())
                        : AssetImage("assets/sound.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 30,
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: _chewieAudioController != null &&
                          _chewieAudioController
                              .videoPlayerController.value.initialized
                      ? ChewieAudio(
                          controller: _chewieAudioController,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Loading'),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
