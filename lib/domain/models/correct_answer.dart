abstract class CorrectAnswer<T> {
  final List<T> correctAnswers;

  CorrectAnswer(this.correctAnswers);
}

class TextAnswer extends CorrectAnswer<String> {
  TextAnswer(super.correctAnswers);
}

class ChoiceAnswer extends CorrectAnswer<int> {
  ChoiceAnswer(super.correctAnswers);
}