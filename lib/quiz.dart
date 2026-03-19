import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/questions_screen.dart';
import 'package:quiz_app_flutter/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget? actviveScreen;

  @override
  void initState() {
    actviveScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      actviveScreen = QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
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
          child: actviveScreen,
        ),
      ),
    );
  }
}