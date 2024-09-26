import 'package:flutter/material.dart';
import 'package:project_major/otp.dart';

class Forgetpasswordmail extends StatelessWidget {
  const Forgetpasswordmail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(height: 30 * 4),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: 30 * 4), // Padding from the top
                      Image(
                        image: AssetImage('assets/forgotpassword.png'),
                        height: size.height * 0.4,
                      ),
                      SizedBox(height: 10), // Space between image and text
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text('Welcome back'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Email"),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
                       Navigator.of(context).pushReplacement(
                             MaterialPageRoute(builder: ((context) => const OTPScreen() ))
                         );
                    }, child: const Text("Next"))),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
