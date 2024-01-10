import 'package:flutter/material.dart';
import 'questions.dart';
import 'Q_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> Score=[
    Icon(Icons.check,color: Colors.green),
    Icon(Icons.close,color: Colors.red),
  ] ;
  List<Icon> Score_keeper=[] ;
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer=QuestionBank.getAnswer(QuestionBank.q_no);
    setState(() {
      if(QuestionBank.isFinished()==true){
        Alert(context: context, title: "Alert", desc: "You have completed your quiz").show();
        QuestionBank.reset();
        Score_keeper=[];
      }
      else{
    if (userPickedAnswer==correctAnswer){
      print("got it right");
      Score_keeper.add(Score[0]);
    }
    else{
      print("got it wrong");
      Score_keeper.add(Score[1]);
    }
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                QuestionBank.getQuestion(QuestionBank.q_no),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green), ),
              // textColor: Colors.white,
              // color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                 checkAnswer(true);
              }
              ),
            ),
          ),
        Expanded(

          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red), ),
              // textColor: Colors.white,
              // color: Colors.green,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                setState(() {
                  QuestionBank.next();

              });
                //The user picked true.
              },
            ),
          ),
        ),
        Row(
          children:Score_keeper,
        ),

        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
