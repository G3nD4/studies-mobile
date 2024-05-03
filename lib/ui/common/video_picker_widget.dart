import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'video_uploader.dart';

class VideoPickerWidget extends StatefulWidget {
  const VideoPickerWidget({super.key});

  @override
  State<VideoPickerWidget> createState() => _VideoPickerWidgetState();
}

class _VideoPickerWidgetState extends State<VideoPickerWidget> {
  File? galleryFile;
  late final ImagePicker picker;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
  }

  @override
  void dispose() {
    _controller?.pause();
    _controller?.removeListener(_playerListener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text('Выбрать видео из галереи'),
                onPressed: () async {
                  await VideoUploader(context, communityId: 0).upload();
                  // _showPicker(context: context);
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
      await _initController();
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

  _initController() async {
    _controller = VideoPlayerController.file(galleryFile!);
    await _controller!.initialize();
    _controller!.addListener(_playerListener);
    _controller!.play();
  }

  void _playerListener() {
    if (!_controller!.value.isInitialized) return;

    if (_controller!.value.position == _controller!.value.duration) {
      _controller!.play();
    }
  }
}
