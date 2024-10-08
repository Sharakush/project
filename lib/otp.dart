import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';


class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CO\nDE", style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80,
              ),),
            Text("Verification".toUpperCase(), style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 40),
            Text("Enter the verification code sent at" + "csdcjhbchebfbfb" , textAlign: TextAlign.center),
            SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {print("OTP is => $code");},
            ),
            SizedBox(height: 20),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {}, child: Text("Next")))
          ],
        ),
      ),
    );
  }
}