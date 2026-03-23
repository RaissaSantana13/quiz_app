enum Difficulty { easy, medium, hard }

class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.difficulty);
  
  final String text; 
  final List<String> answers;
  final Difficulty difficulty;
}