import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
     
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image(image: AssetImage('assets/welcome.jpg'), height: h*0.5,
            ),
          ],
        ),
      ),
    );
  }
}