import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String? hintText;

  const SearchField({super.key, this.hintText});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.color.micIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText ?? 'Поиск',
        hintStyle: context.text.searchHint,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}