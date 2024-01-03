// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_flutter/controllers/controller.dart';
import 'package:tiktok_flutter/views/screens/home_screen.dart';
import 'package:tiktok_flutter/views/views.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  TextEditingController songController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    songController.dispose();
    captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputFieldWidget(
                      labelText: 'Song Name',
                      icon: Icons.music_note,
                      borderColor: Colors.black,
                      controller: songController,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputFieldWidget(
                      labelText: 'Caption',
                      icon: Icons.closed_caption,
                      borderColor: Colors.black,
                      controller: captionController,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      uploadVideoController.uploadVideo(songController.text,
                          captionController.text, widget.videoPath);
                      // print('Share');
                      // uploadVideoController.uploadVideo(songController.text,
                      //     captionController.text, widget.videoPath);
                      Get.offAll(() => const HomeScreen());
                    },
                    child: const Text(
                      'Share!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tiktok_flutter/views/screens/home_screen.dart';
// import 'package:tiktok_flutter/views/views.dart';
// import 'package:video_player/video_player.dart';

// import '../../controllers/controller.dart';

// class ConfirmScreen extends StatefulWidget {
//   final File videoFile;
//   final String videoPath;
//   const ConfirmScreen({
//     Key? key,
//     required this.videoFile,
//     required this.videoPath,
//   }) : super(key: key);

//   @override
//   State<ConfirmScreen> createState() => _ConfirmScreenState();
// }

// class _ConfirmScreenState extends State<ConfirmScreen> {
//   late VideoPlayerController controller;
//   TextEditingController _songController = TextEditingController();
//   TextEditingController _captionController = TextEditingController();

//   UploadVideoController uploadVideoController =
//       Get.put(UploadVideoController());

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       controller = VideoPlayerController.file(widget.videoFile);
//     });
//     controller.initialize();
//     controller.play();
//     controller.setVolume(1);
//     controller.setLooping(true);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 1.5,
//               child: VideoPlayer(controller),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     width: MediaQuery.of(context).size.width - 20,
//                     child: TextInputFieldWidget(
//                       borderColor: Colors.red,
//                       controller: _songController,
//                       labelText: 'Song Name',
//                       icon: Icons.music_note,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10),
//                     width: MediaQuery.of(context).size.width - 20,
//                     child: TextInputFieldWidget(
//                       borderColor: Colors.red,
//                       controller: _captionController,
//                       labelText: 'Caption',
//                       icon: Icons.closed_caption,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         uploadVideoController.uploadVideo(_songController.text,
//                             _captionController.text, widget.videoPath);
//                         print('shared video');
//                         Get.offAll(() => HomeScreen());
//                       },
//                       child: const Text(
//                         'Share!',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
