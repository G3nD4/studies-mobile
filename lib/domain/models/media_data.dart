import 'package:image_picker/image_picker.dart';

class MediaData {
  final int id;
  final String title;
  final String? description;
  final XFile file;

  MediaData({
    required this.id,
    required this.title,
    required this.description,
    required this.file,
  });
}

class EditMediaData {
  String? title;
  String? description;
  XFile? file;

  EditMediaData({this.title, this.description, this.file});
}