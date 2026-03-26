import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/answer_button.dart';
import 'package:quiz_app_flutter/models/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.questions,
  });

  final void Function(String answer) onSelectAnswer;
  final List<QuizQuestion> questions;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  String? selectedAnswer;
  late List<String> currentShuffledAnswers;
  @override
  void initState() {
    super.initState();

    currentShuffledAnswers = widget.questions[currentQuestionIndex]
        .getShuffledAwnswers();
  }

  void answerQuestion(String answer) async {
    setState(() {
      selectedAnswer = answer;
    });

    await Future.delayed(const Duration(milliseconds: 1000));

    widget.onSelectAnswer(answer);

    if (mounted && currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        selectedAnswer = null;
        currentQuestionIndex++;
        currentShuffledAnswers = widget.questions[currentQuestionIndex]
            .getShuffledAwnswers();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    final correctAnswer = currentQuestion.answers[0];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.questions.length,
              backgroundColor: Colors.white24,
              color: Colors.amber,
            ),
            const SizedBox(height: 20),

            Text(
              'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white.withOpacity(0.85),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentShuffledAnswers.map((answer) {
              Color? buttonColor;
              if (selectedAnswer != null) {
                if (answer == correctAnswer) {
                  buttonColor = Colors.green;
                } else if (answer == selectedAnswer) {
                  buttonColor = Colors.red;
                } else {
                  buttonColor = const Color.fromARGB(
                    255,
                    33,
                    1,
                    95,
                  ).withOpacity(0.5);
                }
              }

              return AnswerButton(
                answerText: answer,
                backgroundColor: buttonColor,
                onTap: selectedAnswer == null
                    ? () => answerQuestion(answer)
                    : () {},
              );
            }),
          ],
        ),
      ),
    );
  }
}
