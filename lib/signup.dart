
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_major/LoginScreen.dart';
import 'package:project_major/SignUpContoller.dart';
import 'package:project_major/homepage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus when the screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontoller());
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/welcome1.png'),
                  height: size.height * 0.2,
                ),
                Text('Sign Up',
                    style: Theme.of(context).textTheme.headlineLarge),
                Text(widget.subTitle),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          focusNode: _focusNode,
                          controller: controller.fullname,
                          decoration: InputDecoration(
                            label: Text("Full Name"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_outline_rounded),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            label: Text("Email"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.phoneNo,
                          decoration: InputDecoration(
                            label: Text("Phone No"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.numbers),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.password,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.password),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                controller.registerUser(
                                  controller.email.text.trim(),
                                  controller.password.text.trim(),
                                  () {
                                    // Navigate to the dashboard on success
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Hoomepage()), // Use your actual dashboard
                                    );
                                  },
                                  () {
                                    // Handle error (e.g., show a snackbar or alert)
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Signup failed. Please try again.")),
                                    );
                                  },
                                );
                              }
                              // if (_formkey.currentState!.validate()) {
                              //   Signupcontoller.instance.registerUser(
                              //     controller.email.text.trim(),
                              //     controller.password.text.trim(),
                              //   );
                              // }
                            },
                            child: Text("Sign Up".toUpperCase()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Image(
                          image: AssetImage("assets/google_icon.png"),
                          width: 20,
                        ),
                        label: Text("Sign Up with Google".toUpperCase()),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Loginscreen(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Already Have An Account? ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(text: "Login".toUpperCase()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

























// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:project_major/LoginHeader.dart';
// import 'package:project_major/LoginScreen.dart';
// import 'package:project_major/SignUpContoller.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen(
//       {super.key,
//       required this.image,
//       required this.title,
//       required this.subTitle});

//   final String image, title, subTitle;

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(Signupcontoller());
//     final _formkey = GlobalKey<FormState>();

//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image(
//                     image: AssetImage('assets/welcome1.png'),
//                     height: size.height * 0.2),
//                 Text('Login', style: Theme.of(context).textTheme.headlineLarge),
//                 Text('Welcome back'),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: Form(
//                     key: _formkey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TextFormField(
//                           controller: controller.fullname,
//                           decoration: InputDecoration(
//                               label: Text("Full Name"),
//                               border: OutlineInputBorder(),
//                               prefixIcon: Icon(Icons.person_outline_rounded),
//                               labelStyle: TextStyle()),
//                         ),
//                         const SizedBox(height: 10),
//                         TextFormField(
//                           controller: controller.email,
//                           decoration: InputDecoration(
//                               label: Text("Email"),
//                               border: OutlineInputBorder(),
//                               prefixIcon: Icon(Icons.email_outlined),
//                               labelStyle: TextStyle()),
//                         ),
//                         const SizedBox(height: 10),
//                         TextFormField(
//                           controller: controller.phoneNo,
//                           decoration: InputDecoration(
//                               label: Text("Phone No"),
//                               border: OutlineInputBorder(),
//                               prefixIcon: Icon(Icons.numbers),
//                               labelStyle: TextStyle()),
//                         ),
//                         const SizedBox(height: 10),
//                         TextFormField(
//                           controller: controller.password,
//                           decoration: InputDecoration(
//                               label: Text("Password"),
//                               border: OutlineInputBorder(),
//                               prefixIcon: Icon(Icons.password),
//                               labelStyle: TextStyle()),
//                         ),
//                         const SizedBox(height: 10),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if(_formkey.currentState!.validate()){
//                                 Signupcontoller.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
//                               }
//                             },
//                             child: Text("SignUp".toUpperCase()),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     const Text("OR"),
//                     SizedBox(
//                       width: double.infinity,
//                       child: OutlinedButton.icon(
//                         onPressed: () {},
//                         icon: Image(
//                           image: AssetImage("assets/google_icon.png"),
//                           width: 20,
//                         ),
//                         label: Text("SignUp with Google".toUpperCase()),
//                       ),
//                     ),
//                     TextButton(onPressed: () {
//                        Navigator.of(context).pushReplacement(
//                              MaterialPageRoute(builder: ((context) => const Loginscreen() ))
//                          );
//                     }, child: Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(text: "Already Have An Account ? ", style: Theme.of(context).textTheme.bodySmall),
//                            TextSpan(text: "Login".toUpperCase()),
//                         ]
//                       )
//                     ))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }