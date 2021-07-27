import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz.dart';
import './Quiz.dart';
import './result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return (_QuizAppState());
  }
}

class _QuizAppState extends State<QuizApp> {
  var questionIndex = 0;
  final _question = const [
    {
      'question': 'what is your Favourite Colour ',
      'answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'blue', 'score': 20},
        {'text': 'black', 'score': 15},
        {'text': 'white', 'score': 20},
      ]
    },
    {
      'question': 'which is your favourite animal?',
      'answer': [
        {'text': 'dog', 'score': 10},
        {'text': 'cat', 'score': 15},
        {'text': 'rabbit', 'score': 20},
      ]
    },
    {
      'question': 'Which is your favourite bike',
      'answer': [
        {'text': 'duke', 'score': 10},
        {'text': 'bullete', 'score': 15},
        {'text': 'R15', 'score': 20},
      ]
    }
  ];

  var _totalScore = 0;
  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
    if (questionIndex < _question.length) {
      print("more questions...");
    }
  }

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext bContext) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Quiz Appliaction')),
      body: questionIndex < _question.length
          ? Quiz(
              question: _question,
              questionIndex: questionIndex,
              answerQuestion: answerQuestion,
            )
          : Result(_totalScore, resetQuiz),
    ));
  }
}
