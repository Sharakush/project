import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_major/exceptions/SignUpWithEmailAndPasswordFailure.dart';
import 'package:project_major/homepage.dart';
import 'package:project_major/welcome.dart';

class Authenticationrepository extends GetxController {
  static Authenticationrepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
  if (user == null) {
    print("Navigating to WelcomeScreen");  // Debugging print
    Get.offAll(() => const WelcomeScreen());
  } else {
    print("Navigating to Dashboard");  // Debugging print
    Get.offAll(() => const Hoomepage());
  }
}
    Future<void> createUserWithEmailAndPassword(String email, String password) async {
  try {
    print('Attempting to create user with email: $email'); // Debugging print
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    print('User created successfully'); // Debugging print
  } on FirebaseAuthException catch (e) {
    final ex = Signupwithemailandpasswordfailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}'); // Debugging print
    throw ex; // This will bubble up to the caller
  } catch (_) {
    const ex = Signupwithemailandpasswordfailure();
    print('EXCEPTION - ${ex.message}'); // Debugging print
    throw ex; // This will bubble up to the caller
  }
}

  // Future<void> loginWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //   } catch (_) {}
  // }

  Future<void> loginWithEmailAndPassword(String email, String password, Function onSuccess, Function onError) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    onSuccess();  // Call onSuccess if login is successful
  } on FirebaseAuthException catch (e) {
    final ex = Signupwithemailandpasswordfailure.code(e.code);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    onError();  // Call onError if there's an error
  } catch (_) {
    const ex = Signupwithemailandpasswordfailure();
    print('EXCEPTION - ${ex.message}');
    onError();  // Call onError if there's an unknown error
  }
}


 // Future<void> logout() async => _auth.signOut();  
 Future<void> logout() async {
  await _auth.signOut();
   print("User signed out");
  Get.offAll(() => const WelcomeScreen());
}

}
