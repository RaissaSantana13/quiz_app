import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/questions_screen.dart';
import 'package:quiz_app_flutter/start_screen.dart';
import 'package:quiz_app_flutter/results_screen.dart';
import 'package:quiz_app_flutter/filtered_questions.dart';
import 'package:quiz_app_flutter/models/quiz_questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  late List<QuizQuestion> filteredQuestions;

  var activeScreen = 'start-screen';

  @override
  void initState() {
    super.initState();
    filteredQuestions = getFilteredQuestions();
  }

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      filteredQuestions = getFilteredQuestions(); // nova rodada
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == filteredQuestions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        questions: filteredQuestions,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        questions: filteredQuestions,
        onRestart: switchScreen, // 👈 importante
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: [
                Color.fromARGB(255, 0, 64, 91),
                Color.fromARGB(255, 47, 72, 121),
                Color(0xff5a4f90),
                Color(0xff865598),
                Color(0xffb15b91),
                Color(0xffd7667b),
                Color(0xfff37a57),
                Color(0xffff9913),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}