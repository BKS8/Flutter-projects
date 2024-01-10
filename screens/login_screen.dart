import 'package:flutter/material.dart';
import 'package:flash_chat/Components/MyBox.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginScreen extends StatefulWidget {
  static const String id='login screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 200.0,
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                decoration:kTextFieldDecoration.copyWith(hintText: "Enter your mail id"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                    email=value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter your password"),
                onChanged: (value) {
                  password=value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              MyButton(
                Colors.lightBlueAccent,
                "Log in",
                () async {
                  setState(() {
                    showSpinner=true;
                  });
                        try {
                          final User = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (User != null) {
                            Navigator.pushNamed(context, ChatScreen.id);
                          }
                          setState(() {
                            showSpinner=false;
                          });
                        }
                        catch (e) {
                          print(e);
                        }
                      }
              )
            ],
          ),
        ),
      ),
    );
  }
}
