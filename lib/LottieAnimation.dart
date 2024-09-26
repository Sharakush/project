import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_major/welcome.dart';
class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> {
   @override
  void initState() {
    super.initState();
    Timer( const  Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const WelcomeScreen() ))
      );
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 247),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Lottie.network("https://lottie.host/f0394c99-47e3-4880-b0d4-8166941408f8/1ugdVOAarg.json"),
        ],
      ),
    );
  }
}

