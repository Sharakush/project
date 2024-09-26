// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project_major/ForgetPasswordmail.dart';

// class Loginscreen extends StatefulWidget {
//   const Loginscreen({super.key});

//   @override
//   State<Loginscreen> createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();

//   signIn() async {
//     await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email.text, password: password.text);
//   }

//   @override
//   Widget build(BuildContext context) {
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
//                 Form(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       TextField(
//                         controller: email,
//                         decoration: const InputDecoration(
//                             prefixIcon: Icon(Icons.person_outline_outlined),
//                             hintText: 'Enter email'),
//                       ),
//                       SizedBox(height: 10),
//                       TextField(
//                         controller: password,
//                         decoration: const InputDecoration(
//                           prefixIcon: Icon(Icons.password),
//                           hintText: 'Enter password',
//                           border: OutlineInputBorder(),
//                           suffixIcon: IconButton(
//                             onPressed: null,
//                             icon: Icon(Icons.remove_red_eye_sharp),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                             onPressed: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 builder: (context) => Container(
//                                   padding: const EdgeInsets.all(30),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text('Make Selection',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headlineLarge),
//                                       Text(
//                                           "Select one of the options given below to reset your password",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyMedium),
//                                       const SizedBox(height: 30),
//                                       ForgetPasswordWidget(
//                                         buttonIcon: Icons.mail_outline_rounded,
//                                         title: 'Email',
//                                         subTitle: 'Reset vis Mail Verification',
//                                         onTap: () {
//                                           Navigator.pop(context);
//                                           Navigator.of(context).pushReplacement(
//                                               MaterialPageRoute(
//                                                   builder: ((context) =>
//                                                       const Forgetpasswordmail())));
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       ForgetPasswordWidget(
//                                         buttonIcon:
//                                             Icons.mobile_friendly_rounded,
//                                         title: 'Phone No',
//                                         subTitle:
//                                             'Reset vis Phone Verification',
//                                         onTap: () {},
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: const Text("Forget Password ?")),
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                             onPressed: (() => signIn()), child: Text("Login")),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text("OR"),
//                     SizedBox(
//                       width: double.infinity,
//                       child: OutlinedButton.icon(
//                         icon: Image(
//                             image: AssetImage('assets/google_icon.png'),
//                             width: 20),
//                         onPressed: () {},
//                         label: Text("SignIn with Google"),
//                       ),
//                     )
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

// class ForgetPasswordWidget extends StatelessWidget {
//   const ForgetPasswordWidget({
//     super.key,
//     required this.buttonIcon,
//     required this.title,
//     required this.subTitle,
//     required this.onTap,
//   });

//   final IconData buttonIcon;
//   final String title, subTitle;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey.shade200,
//         ),
//         child: Row(
//           children: [
//             const Icon(Icons.mail_lock_rounded, size: 60),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: Theme.of(context).textTheme.bodyLarge),
//                 Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Make sure to import GetX
import 'package:project_major/ForgetPasswordmail.dart';
import 'package:project_major/homepage.dart'; // Import the homepage

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: password.text);
      
      // Navigate to the homepage on successful login
      Get.offAll(() => const Hoomepage()); 
    } on FirebaseAuthException catch (e) {
      // Show error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.message}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    height: size.height * 0.2),
                Text('Login', style: Theme.of(context).textTheme.headlineLarge),
                Text('Welcome back'),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            hintText: 'Enter email'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: password,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: 'Enter password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.remove_red_eye_sharp),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                builder: (context) => Container(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Make Selection',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge),
                                      Text(
                                          "Select one of the options given below to reset your password",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      const SizedBox(height: 30),
                                      ForgetPasswordWidget(
                                        buttonIcon: Icons.mail_outline_rounded,
                                        title: 'Email',
                                        subTitle: 'Reset via Mail Verification',
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      const Forgetpasswordmail())));
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      ForgetPasswordWidget(
                                        buttonIcon:
                                            Icons.mobile_friendly_rounded,
                                        title: 'Phone No',
                                        subTitle:
                                            'Reset via Phone Verification',
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Text("Forget Password ?")),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: signIn, // Directly call signIn
                            child: Text("Login")),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: Image(
                            image: AssetImage('assets/google_icon.png'),
                            width: 20),
                        onPressed: () {}, // Implement Google Sign-In if needed
                        label: Text("Sign In with Google"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.buttonIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData buttonIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            const Icon(Icons.mail_lock_rounded, size: 60),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyLarge),
                Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            )
          ],
        ),
      ),
    );
  }
}

