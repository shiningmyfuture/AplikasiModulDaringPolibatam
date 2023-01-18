import 'dart:async';

import 'package:aplikasi_modul_daring/model/module_dosen.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// void main() => runApp(const VideoPlayerApp());

// class VideoPlayerApp extends StatelessWidget {
//   const VideoPlayerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Video Player Demo',
//       home: VideoPlayerScreen(),
//     );
//   }
// }

class VideoPlayerScreen extends StatefulWidget {
  final ModuleModel moduleModel;

  const VideoPlayerScreen({super.key, required this.moduleModel});
  // const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<void> loadVideoPlayer() async {
    controller = VideoPlayerController.network(widget.moduleModel.modulLink);
    await Future.wait([controller.initialize()]).then((value) {
      print('Video ' + widget.moduleModel.judulModul + ' Ready!');
    });

    chewieController = ChewieController(
      videoPlayerController: controller,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
      autoInitialize: true,
      materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red.shade300,
          handleColor: Colors.red,
          backgroundColor: Colors.black54,
          bufferedColor: Colors.grey),
    );
    setState(() {});
  }

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text(widget.moduleModel.judulModul),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: chewieController != null &&
                          chewieController!
                              .videoPlayerController.value.isInitialized
                      ? Chewie(controller: chewieController!)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Loading!...')
                          ],
                        )))
        ],
      ),
    );
  }
}
