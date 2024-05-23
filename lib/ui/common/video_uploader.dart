import 'dart:developer';

import 'package:coursor_tiktok/domain/models/media_data.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/services/auth/api.dart';
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
    // Показываем индикатор загрузки.
    _showLoadingIndicator();
    // Загружаем видео.
    API().uploadVideo(editMediaData).then(
      (value) {
        // После того, как загрузили, показываем сообщение об успешной загрузке.
        Navigator.pop(context);
        _showSuccessDialog();
      },
    );
  }

  Future<void> _showSuccessDialog() async {
    await showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Видео опубликовано!'),
      ),
    );
  }

  Future<void> _showLoadingIndicator() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            DefaultTextStyle(
              style: context.text.appDescription,
              child: const Text('Загрузка...'),
            )
          ],
        ),
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
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Выберите видео на устройстве',
                style: context.text.appDescription,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.veryLightGrey,
                  elevation: 0.0,
                  textStyle:
                      context.text.appDescription.copyWith(fontSize: 10.0),
                ),
                onPressed: () async {
                  await _getVideo(context);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'Загрузить',
                  style: context.text.appDescription.copyWith(
                    fontSize: 10.0,
                    color: AppColors.black,
                  ),
                ),
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
