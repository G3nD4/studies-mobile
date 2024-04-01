import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DefaultCircleAvatar extends StatelessWidget {
  final String? url;
  final double? radius;
  const DefaultCircleAvatar({super.key, this.url, this.radius});

  String get imageUrl =>
      url ??
      "https://pixelbox.ru/wp-content/uploads/2022/08/avatars-viber-pixelbox.ru-106.jpg";

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 36.0,
      backgroundImage: CachedNetworkImageProvider(
        imageUrl,
        scale: 1,
      ),
    );
  }
}
