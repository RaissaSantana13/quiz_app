import 'dart:math';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/models/quiz_questions.dart';

List<QuizQuestion> getFilteredQuestions() {
  final random = Random();

  final easyPool = questions
      .where((q) => q.difficulty == Difficulty.easy)
      .toList();
  final mediumPool = questions
      .where((q) => q.difficulty == Difficulty.medium)
      .toList();
  final hardPool = questions
      .where((q) => q.difficulty == Difficulty.hard)
      .toList();

  easyPool.shuffle(random);
  mediumPool.shuffle(random);
  hardPool.shuffle(random);

  final selectedEasy = easyPool.take(5).toList();
  final selectedMedium = mediumPool.take(3).toList();
  final selectedHard = hardPool.take(2).toList();

  final finalQuestions = [...selectedEasy, ...selectedMedium, ...selectedHard];

  finalQuestions.shuffle(random);

  return finalQuestions;
}
