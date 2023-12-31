// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItemWidget extends StatefulWidget {
  const VideoPlayerItemWidget({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);
  final String videoUrl;
  @override
  State<VideoPlayerItemWidget> createState() => _VideoPlayerItemWidgetState();
}

class _VideoPlayerItemWidgetState extends State<VideoPlayerItemWidget> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) {
            videoPlayerController.play();
            videoPlayerController.setVolume(1);
          });
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
