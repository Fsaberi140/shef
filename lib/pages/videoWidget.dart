// import 'package:flutter/cupertino.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';
//
// class Video extends StatefulWidget {
//   const Video({Key? key}) : super(key: key);
//
//   @override
//   State<Video> createState() => _VideoState();
// }
//
// class _VideoState extends State<Video> {
//   late final VideoPlayerController _controller =
//   VideoPlayerController.asset("assets/video/1.mp4")
//     ..initialize()
//     ..setLooping(true)
//     ..play();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(child: VideoPlayer(_controller)),
//           Positioned.fill(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       VideoProgressIndicator(
//                         _controller,
//                         allowScrubbing: true,
//                         colors: const VideoProgressColors(
//                             playedColor: Colors.white,
//                             backgroundColor: Colors.white10),
//                       ),
//                       Row(
//                         children: [
//                           Text("44", style:themeData.textTheme.caption ,),
//                           Text(widget._controller.value.),
//                         ],
//                       ),
//                       const SizedBox(height: 5,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 CupertinoIcons.backward_fill,
//                                 color: Colors.white,
//                                 size: 28,
//                               )),
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 _controller.value.isPlaying ? CupertinoIcons :
//                                 CupertinoIcons.play_circle_fill,
//                                 color: Colors.white,
//                                 size: 56,
//                               )),
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 CupertinoIcons.forward_fill,
//
//                                 color: Colors.white,
//                                 size: 28,
//                               )),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
//               ))
//         ],
//       ),
//     );
//   }
// }
