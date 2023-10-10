class RadioButtonAnswer {
  final int answerId;
  final int questionId;
  final String answerTitle;
  bool isSelected;

  RadioButtonAnswer({
    required this.answerId,
    required this.questionId,
    required this.answerTitle,
    this.isSelected = false,
  });
}
