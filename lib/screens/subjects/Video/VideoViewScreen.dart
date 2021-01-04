// import 'package:flutter/material.dart';

// class VideoViewScreen extends StatefulWidget {
//   @override
//   _VideoViewScreenState createState() => _VideoViewScreenState();
// }

// class _VideoViewScreenState extends State<VideoViewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("asdsad"),
//     );
//   }
// }

import 'package:LoginSample/models/UploadDocument.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
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
      autoPlay: true,
      looping: true,
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
    return Scaffold(
      appBar: AppBar(
        title: Text("video"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController.videoPlayerController.value.initialized
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
    );
  }
}
