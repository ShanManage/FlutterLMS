import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomButton.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class AudioViewScreen extends StatefulWidget {
  UploadDocument ud;
  bool isPlay = false;

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
    initializePlayer();
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
      // autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: TargetPlatform.iOS,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.widget.ud.title.toString()),
        ),
        body: Column(
          children: <Widget>[
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
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                (this.widget.isPlay == false)
                    ? Expanded(
                        child: CustomButton(
                          textColor: Colors.black,
                          bgColor: Colors.green[200],
                          title: "PLAY",
                          callback: () {
                            setState(() {
                              _chewieAudioController = ChewieAudioController(
                                videoPlayerController: _videoPlayerController1,
                                autoPlay: true,
                                looping: true,
                              );
                              this.widget.isPlay = true;
                            });
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: blockHeight * 10),
          ],
        ),
      ),
    );
  }
}
