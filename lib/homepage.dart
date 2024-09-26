import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_major/main.dart';
import 'package:project_major/welcome.dart';

class Hoomepage extends StatefulWidget {
  const Hoomepage({super.key});

  @override
  State<Hoomepage> createState() => _HoomepageState();
}

class _HoomepageState extends State<Hoomepage> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
  await FirebaseAuth.instance.signOut().then((_) {
    // Ensure you redirect to the WelcomeScreen after signout
    Get.offAll(() => const WelcomeScreen());
  }).catchError((error) {
    // Handle any potential errors during sign-out
    print("Sign out error: $error");
  });
}


  // signout()async{
  //   await FirebaseAuth.instance.signOut();
  //    Get.offAll(() => const WelcomeScreen());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      
      body: Center(
        child: Text('${user!.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=>signout() ),
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}
