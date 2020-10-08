import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pc_expert/Pages/MarquePage.dart';
import 'package:pc_expert/model/Constant.dart';

class WelcomeHome extends StatelessWidget {
  const WelcomeHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242A36),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FadeAnimatedTextKit(
                  text: titleWelcome,
                  textStyle: TextStyle(color: Colors.white, fontSize: 25)),
              Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Image.asset("images/pc_expert.jpg")),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Si vous recherchez un composant de votre ordinateur soit portable ou bureau, vous cherchez de reparer votre defectuex pc nous somme la pour vous aider.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MarquePage()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
