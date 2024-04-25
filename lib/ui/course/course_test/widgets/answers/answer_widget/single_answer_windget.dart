import 'package:flutter/material.dart';

import '../answer_filed_widgets/single_answer_field_widget.dart';

class SingleAnswerWidget extends StatefulWidget {
  final List<String> answersText;

  const SingleAnswerWidget({super.key, required this.answersText});

  @override
  State<SingleAnswerWidget> createState() => _SingleAnswerWidgetState();
}

class _SingleAnswerWidgetState extends State<SingleAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SingleAnswerFieldWidget(
          text: widget.answersText[index],
        );
      },
      itemCount: widget.answersText.length,
    );
  }
}
