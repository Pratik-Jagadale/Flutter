import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function questionHandler;
  final String answerText;
  Answer(this.questionHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(28),
      child:
          ElevatedButton(child: Text(answerText), onPressed: questionHandler),
    );
  }
}
