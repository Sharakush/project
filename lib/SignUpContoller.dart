import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_major/authenticationRepository.dart';
import 'package:project_major/exceptions/SignUpWithEmailAndPasswordFailure.dart';

class Signupcontoller extends GetxController{
  static Signupcontoller get instance => Get.find();


  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();


  // void registerUser(String email, String password){
  //   Authenticationrepository.instance.createUserWithEmailAndPassword(email, password);

  // }

//  void registerUser(String email, String password, Function onSuccess, Function onError) {
//   Authenticationrepository.instance.createUserWithEmailAndPassword(email, password).then((_) {
//     // Call onSuccess only after successful registration
//     onSuccess();
//   }).catchError((error) {
//     // Call onError if there's an error
//     print("Signup error: $error");
//     onError();
//   });
// }

void registerUser(String email, String password, Function onSuccess, Function onError) {
  Authenticationrepository.instance.createUserWithEmailAndPassword(email, password)
      .then((_) {
    onSuccess();
  }).catchError((error) {
    if (error is Signupwithemailandpasswordfailure) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text("Signup failed. Please try again.")),
      );
    }
    onError();
  });
}




}