import 'dart:developer';
import 'dart:io';

import 'package:coursor_tiktok/domain/models/media_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../redact_media/redact_video/redact_video_screen.dart';

class VideoUploader {
  final int communityId;
  final BuildContext context;
  XFile? file;

  VideoUploader(this.context, {required this.communityId});

  Future<void> upload() async {
    await _pickFile(context);
    // If nothing is selected - finish the upload.
    if (file == null) {
      return;
    }
    EditMediaData editMediaData = await _getMediaData();
    // TODO: upload video to server
    log('title: ${editMediaData.title}, description: ${editMediaData.description}');
    Future.delayed(const Duration(seconds: 2)).then((_) {
      _showSuccessDialog();
    });
  }

  Future<void> _showSuccessDialog() async {
    await showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Видео опубликовано!'),
      ),
    );
  }

  Future<EditMediaData> _getMediaData() async {
    EditMediaData editMediaData = EditMediaData(file: file);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RedactVideoScreen(
          editMediaData: editMediaData,
        ),
      ),
    );
    return editMediaData;
  }

  Future<void> _pickFile(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Галерея'),
                onTap: () async {
                  await _getVideo(context);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getVideo(BuildContext context) async {
    final pickedFile = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
      maxDuration: const Duration(minutes: 15),
    );
    if (pickedFile != null) {
      file = pickedFile;
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ничего не выбрано'),
          ),
        );
      }
      file = null;
    }
  }
}
