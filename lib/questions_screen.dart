import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/answer_button.dart';
import 'package:quiz_app_flutter/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion() {
  setState(() {
    if (currentQuestionIndex < 9 && currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    } else {
      // O que acontece após a 10ª pergunta? 
      // Exemplo: Voltar para o início ou navegar para tela de resultados 
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAwnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: answerQuestion ,);
            }),
          ],
        ),
      ),
    );
  }
}
