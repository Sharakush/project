import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_major/main.dart';

class Hoomepage extends StatefulWidget {
  const Hoomepage({super.key});

  @override
  State<Hoomepage> createState() => _HoomepageState();
}

class _HoomepageState extends State<Hoomepage> {
  final user = FirebaseAuth.instance.currentUser;

  signout()async{
    await FirebaseAuth.instance.signOut();
  }

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
        onPressed: (()=>signout()),
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}
