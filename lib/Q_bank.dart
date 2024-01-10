import 'questions.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
class QuestionBank{
 static int q_no=0;
 static List<Question> _questionBank=[
    Question(q: "You can lead a cow down stairs but not up stairs.", a: false),
    Question(q: "Approximately one quarter of human bones are in the feet.", a: true),
    Question(q: "A slug\'s blood is green.", a: true),
  ];
  static void next(){
    if(q_no<_questionBank.length-1){
      q_no++;
    }
  }
  static String getQuestion(int questionNo) {
    return _questionBank[questionNo].questionText;
  }
  static bool getAnswer(int questionNo){
    return _questionBank[questionNo].questionAnswer;
  }
  static bool isFinished() {
    if (q_no >= _questionBank.length - 1) {
      return true;
    }
    else {
      return false;
    }
  }
  static void reset(){
    q_no=0;
  }
}
