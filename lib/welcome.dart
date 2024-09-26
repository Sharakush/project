import 'package:flutter/material.dart';
import 'package:project_major/LoginScreen.dart';
import 'package:project_major/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: AssetImage('assets/welcome1.png'), height: height * 0.6),
            Column(
              children: [
                Text('Welcome',
                    style: Theme.of(context).textTheme.headlineLarge),
                Text(
                  'to the application',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                           Navigator.of(context).pushReplacement(
                             MaterialPageRoute(builder: ((context) => const Loginscreen() ))
                         );
                        }, child: Text('Login'.toUpperCase()))),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).pushReplacement(
                             MaterialPageRoute(builder: ((context) => const SignUpScreen(image: '', title: '', subTitle: '',) ))
                         );
                        }, child: Text("SignUp".toUpperCase()))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
