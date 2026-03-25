import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/models/quiz_questions.dart';
import 'package:quiz_app_flutter/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.questions,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final List<QuizQuestion> questions;
  final VoidCallback onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final correctAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANTE
          children: [
            Text(
              'You answered $correctAnswers out of ${questions.length} correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // ✅ CENTRALIZADO + TAMANHO FIXO
            SizedBox(
              height: 400,
              width: 350,
              child: QuestionsSummary(summaryData),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: onRestart,
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}