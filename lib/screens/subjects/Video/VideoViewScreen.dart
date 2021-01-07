import 'package:LoginSample/models/UploadDocument.dart';
import 'package:LoginSample/screens/CustomWidgets/CustomText.dart';
import 'package:LoginSample/screens/shared/sizeConfig.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewScreen extends StatefulWidget {
  UploadDocument ud;
  VideoViewScreen({@required this.ud});

  @override
  State<StatefulWidget> createState() {
    return _VideoViewScreen();
  }
}

class _VideoViewScreen extends State<VideoViewScreen> {
  double blockWidth = SizeConfig.safeBlockHorizontal;
  double blockHeight = SizeConfig.safeBlockVertical;

  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    this.initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.network(this.widget.ud.docURL.toString());
    await _videoPlayerController1.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
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
                    Container(
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
              Expanded(
                child: Center(
                  child: _chewieController != null &&
                          _chewieController
                              .videoPlayerController.value.initialized
                      ? Chewie(
                          controller: _chewieController,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
