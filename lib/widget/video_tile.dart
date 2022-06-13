import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/video.dart';
import 'package:lottie/lottie.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({Key? key, required this.video, required this.snappedPageIndex, required this.currentIndex}) : super(key: key);
  final Video video;
  final int snappedPageIndex;
  final int currentIndex;

  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _videoController;
  late Future _initializeVideoPlayer;
  bool isVideoPlaying = true;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset("assets/${widget.video.videoUrl}");
    _initializeVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
    super.initState();
  }
  @override
  void dispose(){
    _videoController.dispose();
    super.dispose();
  }
  void _pausePlaVideo() {
    isVideoPlaying ? _videoController.pause() : _videoController.play();
    setState(() =>{
    isVideoPlaying = !isVideoPlaying
    });
  }
  @override
  Widget build(BuildContext context) {
    (widget.snappedPageIndex == widget.currentIndex  && isVideoPlaying  ) ? _videoController.play() : _videoController.pause();
    return Container(
      color: Colors.grey,
      child: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return GestureDetector(
              onTap: () => {_pausePlaVideo()},
              child: Stack(
           alignment: Alignment.center,
                children: [
                  VideoPlayer(_videoController),
                  IconButton(onPressed: ()=> {
                    _pausePlaVideo()
                  }, icon: Icon(Icons.play_arrow, size: 60, color: Colors.white.withOpacity( isVideoPlaying ? 0 : 0.5),))
                ],
              ),
            );
          }else{
            return Container(
             alignment: Alignment.center,
             child: Lottie.asset("assets/24817-tiktok-loader.json", width: 100, height: 100, fit: BoxFit.cover),
            );
          }
        }),
      );
  }
}
