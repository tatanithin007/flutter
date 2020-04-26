import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });

    // print("Answer choosen");
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questiontext': 'who are you',
        'answers': ['Nithin', 'jaswanth', 'someone']
      },
      {
        'questiontext': 'What is your favorite animal',
        'answers': ['Dog', 'Donkey', 'someone']
      },
      {
        'questiontext': 'What is your favorite colour',
        'answers': ['Red', 'Green', 'Yellow']
      },
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "My First App",
            ),
          ),
          body: Column(
            children: [
              Question(questions[questionIndex]['questiontext']),
              ...(questions[questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}
