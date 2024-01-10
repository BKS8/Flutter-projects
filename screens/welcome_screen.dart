import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/Components/MyBox.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id='welcome screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animator;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(
        duration: Duration(seconds: 3),
            vsync: this,
    );
    animator=ColorTween(begin: Colors.black,end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(animator.value);
    });
    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animator.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                    tag:'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      // width: 198.0,
                      height: 60.0,
                    )
                ),
                Container(
                  child: TypewriterAnimatedTextKit(
                    text: ['Flash Chat'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  // width: 165.0,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyButton(
              Colors.lightBlueAccent,
              "log in",
                (){Navigator.pushNamed(context, LoginScreen.id);},
            ),
            MyButton(
              Colors.lightBlueAccent,
              "register",
                (){Navigator.pushNamed(context, RegistrationScreen.id);}
            )

          ],
        ),
      ),
    );
  }
}

