// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:lottie/lottie.dart';
// //import 'package:project_major/ForgetPasswordmail.dart';
// import 'package:project_major/LottieAnimation.dart';
// import 'package:project_major/authenticationRepository.dart';

// //import 'package:project_major/welcome.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Firebase without FlutterFire CLI
//   await Firebase.initializeApp().then((_) {
//     Get.put(Authenticationrepository());
//   });

//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp().then((_) {
//   //   Get.put(Authenticationrepository());
//   // });  //(options: DefaultFirebaseOptions.currentPlatform).then((Value) => Get.put(Authenticationrepository()));
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//             seedColor: const Color.fromARGB(255, 130, 192, 221)),
//         useMaterial3: true,
//       ),
//       home: LottieAnimation(),

//     );
//   }
// }






import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_major/LottieAnimation.dart';
import 'package:project_major/authenticationRepository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp().then((_) {
    Get.put(Authenticationrepository());
  });

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 130, 192, 221)),
        useMaterial3: true,
      ),
      home: LottieAnimation(), // Your initial screen
    );
  }
}
