import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final String videoPath;
  VideoPreviewScreen({required this.videoPath});

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.file(File(widget.videoPath))
    ..initialize().then((_) {
      setState(() {

      });
      _controller.play();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: _controller.value.isInitialized ?
          AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller),) :
              CircularProgressIndicator()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon( _controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.black,),
      ),
    );
  }
}
