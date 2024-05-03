import 'package:coursor_tiktok/domain/enums/edit_screen_open_type.dart';
import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
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
  String get saveButtonText =>
      widget.type == EditType.edit ? 'Сохранить' : 'Опубликовать';
  
  String get appBarTitle => widget.type == EditType.edit ? 'Новое видео (предпросмотр)' : 'Редактирование видео';

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
                  child:
                      const Placeholder(), // TODO: сделать виджет видеоплеера и запихать сюда
                ),
              ),
              AppInputDecorations.underline(
                textFormField: TextFormField(
                  onChanged: (value) {
                    widget.editMediaData.title = value;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Введите название видео...'),
                ),
              ),
              AppInputDecorations.underline(
                textFormField: TextFormField(
                  onChanged: (value) {
                    widget.editMediaData.description = value;
                  },
                  decoration:
                      const InputDecoration(hintText: 'Добавьте подпись...'),
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
                child: const Text('Сохранить черновик'),
              ),
              AppButtons.defaultButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: AppColors.purple,
                child: Text(saveButtonText),
              )
            ],
          ),
        ],
      ),
    );
  }
}
