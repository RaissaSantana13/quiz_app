import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chooseAnswer});

  final List<String> chooseAnswer;

  List<Map<String, Object >>getSummaryData(){
    final  List<Map<String, Object >> summary = [];

    for (var i =0; i < chooseAnswer.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(margin: const EdgeInsets.all(20), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You answered X out of Y questions correctly!'),
          const SizedBox(height: 30,),
          QuestionsSummary(getSummaryData()), 
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: () {}, child: const Text('Restart Quiz!'))
        ],
      )),
    );
  }
}
