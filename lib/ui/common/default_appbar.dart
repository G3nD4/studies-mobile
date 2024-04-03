import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool implyLeading;
  const DefaultAppBar({
    super.key,
    required this.title,
    this.implyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: implyLeading ? const BackButton() : null,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
