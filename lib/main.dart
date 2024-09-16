import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_major/welcome.dart';
import 'package:project_major/wrapper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 130, 192, 221)),
        useMaterial3: true,
      ),
      home: Wrapper(),
    );
  }
}