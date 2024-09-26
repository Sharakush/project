import 'package:flutter/material.dart';

class Signupwithemailandpasswordfailure {
  final String message;

const  Signupwithemailandpasswordfailure([this.message = "An Unknown error occurred"]);

factory Signupwithemailandpasswordfailure.code(String code){
  switch(code){
    case 'weak-password' : 
      return const Signupwithemailandpasswordfailure('Please enter a stronger password.');
    case 'invalid-email' : 
      return const Signupwithemailandpasswordfailure('Email is not valid or badly formatted');
    case 'email-already-in-use' : 
      return const Signupwithemailandpasswordfailure('An account already exists for that email.');
    case 'operation-not-allowed' : 
      return const Signupwithemailandpasswordfailure('Operation is not allowed. PLease contact support.');
    case 'user-disabled' : 
      return const Signupwithemailandpasswordfailure('This user has been disabled. Please contact support for help.');
    default: return Signupwithemailandpasswordfailure();
  }
}
}