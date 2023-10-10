import 'package:flutter/material.dart';
import 'package:talent_link/src/domain/entities/question/radio_button_answer.dart';

class Question {
  int? questionId;
  String? questionTitle;
  int? questionTypeId;
  bool? isMandatory;
  bool? notAnswered;
  GlobalKey? key;
  List<RadioButtonAnswer>? radioButtonAnswerList;
  dynamic viewObject;
  int? relatedQuestionId;
  int? relatedAnswerID;
  bool isRelated;
  bool isHasRelatedQuestion;
  dynamic answer;
  String? label;

  Question(
      {this.questionTypeId,
        this.radioButtonAnswerList,
        this.relatedAnswerID,
        this.questionId,
        this.questionTitle,
        this.relatedQuestionId = 0,
        this.viewObject,
        this.isMandatory,
        this.notAnswered,
        this.key,
        this.answer,
        this.label,
        this.isRelated = false,
        this.isHasRelatedQuestion = false});
}
