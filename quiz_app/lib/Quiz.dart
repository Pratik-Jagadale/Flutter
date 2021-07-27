import 'package:flutter/material.dart';

import './Answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.question,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: [
        Question(
          question[questionIndex]['question'],
        ),
        ...(question[questionIndex]['answer'] as List<
                Map<String,
                    Object>>) // ... spread operator they they take a list and pull out to list
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
