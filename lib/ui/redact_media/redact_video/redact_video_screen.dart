import 'dart:io';

import 'package:coursor_tiktok/domain/enums/edit_screen_open_type.dart';
import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../domain/models/media_data.dart';

class RedactVideoScreen extends StatefulWidget {
  final EditType type;
  final EditMediaData editMediaData;

  const RedactVideoScreen({
    super.key,
    required this.editMediaData,
    this.type = EditType.create,
  });

  @override
  State<RedactVideoScreen> createState() => _RedactVideoScreenState();
}

class _RedactVideoScreenState extends State<RedactVideoScreen> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    assert(widget.editMediaData.file != null, 'File must not be null');
    _controller = VideoPlayerController.file(
      File(widget.editMediaData.file!.path),
    );
    _controller.addListener(_videoPlayerListener);
  }

  _videoPlayerListener() {
    if (_controller.value.isCompleted) {
      _controller.play();
    }
  }

  String get saveButtonText =>
      widget.type == EditType.edit ? 'Сохранить' : 'Опубликовать';

  String get appBarTitle => widget.type == EditType.edit
      ? 'Новое видео (предпросмотр)'
      : 'Редактирование видео';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Редактирование видео',
        implyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: FutureBuilder(
                    future: _controller.initialize(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // TODO: сделать виджет видеоплеера и запихать сюда
                        _controller.play();
                        return VideoPlayer(_controller);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                  ),
                ),
              ),
              AppInputDecorations.underline(
                textFormField: TextFormField(
                  onChanged: (value) {
                    widget.editMediaData.title = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Введите название видео...',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
              AppInputDecorations.underline(
                textFormField: TextFormField(
                  onChanged: (value) {
                    widget.editMediaData.description = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Добавьте подпись...',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppButtons.defaultButton(
                onPressed: () {},
                color: AppColors.lightGrey,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Сохранить черновик'),
                ),
              ),
              AppButtons.defaultButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: AppColors.purple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    saveButtonText,
                    style: context.text.labelStyle
                        .copyWith(color: AppColors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
