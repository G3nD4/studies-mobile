import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPickerWidget extends StatefulWidget {
  const VideoPickerWidget({super.key});

  @override
  State<VideoPickerWidget> createState() => _VideoPickerWidgetState();
}

class _VideoPickerWidgetState extends State<VideoPickerWidget> {
  File? galleryFile;
  late final ImagePicker picker;
  late VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text('Выбрать видео из галереи'),
                onPressed: () {
                  _showPicker(context: context);
                },
              ),
            ),
            if (galleryFile != null)
              _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: GestureDetector(
                        onTap: () {
                          if (_controller!.value.isPlaying) {
                            _controller!.pause();
                          } else {
                            _controller!.play();
                          }
                        },
                        child: VideoPlayer(_controller!),
                      ),
                    )
                  : Container(),
          ],
        ),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Галерея'),
                onTap: () {
                  getVideo(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getVideo(ImageSource img) async {
    final pickedFile = await picker.pickVideo(
      source: img,
      preferredCameraDevice: CameraDevice.front,
      maxDuration: const Duration(minutes: 10),
    );
    final XFile? xfilePick = pickedFile;
    if (xfilePick != null) {
      galleryFile = File(pickedFile!.path);
      await initController();
      setState(() {});
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ничего не выбрано'),
          ),
        );
      }
    }
  }

  initController() async {
    _controller = VideoPlayerController.file(galleryFile!);
    await _controller!.initialize();
  }
}
