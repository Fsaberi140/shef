import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();

}


class _VideoState extends State<Video> {
  late final VideoPlayerController? _controller= VideoPlayerController.asset("assets/video/1.mp4")
  ..initialize()
  ..play()
  ;


  // @override
 //  void initState() {
 //    _controller.initialize();
 //    super.initState();
 //  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        Positioned.fill(child: VideoPlayer(_controller!))
      ],),
    );
  }
}