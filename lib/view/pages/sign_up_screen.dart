// // import 'package:chat_app/core/extension/app_sizes.dart';
// // import 'package:flutter/material.dart';

// // class SignUpScreen extends StatelessWidget {
// //   const SignUpScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color.fromARGB(255, 95, 47, 179),
// //       body: Column(
// //         children: [
// //           const SizedBox(
// //             height: 150,
// //           ),
// //           const Text(
// //             "Create Your Account",
// //             style: TextStyle(
// //                 fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
// //           ),
// //           const SizedBox(
// //             height: 25,
// //           ),
// //           SizedBox(
// //             width: 300,
// //             height: 50,
// //             child: TextField(
// //               decoration: InputDecoration(
// //                 labelText: 'Username',
// //                 labelStyle: TextStyle(
// //                   color: Colors.black,
// //                 ),
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 contentPadding: EdgeInsets.symmetric(vertical: 12),
// //                 prefixIcon: Icon(
// //                   Icons.person,
// //                   color: Colors.black,
// //                 ),
// //                 border: OutlineInputBorder(
// //                   borderSide: BorderSide.none,
// //                   borderRadius: BorderRadius.circular(5),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(
// //             height: 20,
// //           ),
// //           SizedBox(
// //             width: 300,
// //             height: 50,
// //             child: TextField(
// //               decoration: InputDecoration(
// //                 labelText: 'Email',
// //                 labelStyle: TextStyle(
// //                   color: Colors.black,
// //                 ),
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 contentPadding: EdgeInsets.symmetric(vertical: 12),
// //                 prefixIcon: Icon(
// //                   Icons.email,
// //                   color: Colors.black,
// //                 ),
// //                 border: OutlineInputBorder(
// //                   borderSide: BorderSide.none,
// //                   borderRadius: BorderRadius.circular(5),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(
// //             height: 30,
// //           ),
// //           SizedBox(
// //             width: 300,
// //             height: 50,
// //             child: TextField(
// //               obscureText: true,
// //               decoration: InputDecoration(
// //                 // labelText: 'Password',
// //                 label: Text('password'),
// //                 labelStyle: TextStyle(
// //                   color: Colors.black,
// //                 ),
// //                 filled: true,
// //                 fillColor: Colors.white,
// //                 contentPadding: EdgeInsets.symmetric(vertical: 12),
// //                 prefixIcon: Icon(
// //                   Icons.lock,
// //                   color: Colors.black,
// //                 ),
// //                 border: OutlineInputBorder(
// //                   borderSide: BorderSide.none,
// //                   borderRadius: BorderRadius.circular(5),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(
// //             height: 70,
// //           ),
// //           SizedBox(
// //             height: 60,
// //             width: MediaQuery.sizeOf(context).width / 1.3,
// //             child:
// //                 ElevatedButton(onPressed: () {}, child: const Text('SignUp')),
// //           ),
// //           const SizedBox(
// //             height: 40,
// //           ),
// //           SizedBox(
// //             width: MediaQuery.sizeOf(context).width,
// //             height: 20,
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 SizedBox(
// //                   width: context.width(0.25),
// //                   child: const Divider(),
// //                 ),
// //                 const Padding(
// //                   padding: EdgeInsets.symmetric(horizontal: 15),
// //                   child: Text(
// //                     'or continue with',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                 ),
// //                 SizedBox(width: context.width(0.25), child: const Divider())
// //               ],
// //             ),
// //           ),
// //           const SizedBox(
// //             height: 40,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     minimumSize:
// //                         Size(context.width(0.02), context.height(0.06)),
// //                     shape: const BeveledRectangleBorder(
// //                         side: BorderSide(
// //                           width: 0.2,
// //                           color: Colors.grey,
// //                         ),
// //                         borderRadius: BorderRadius.all(Radius.circular(5))),
// //                   ),
// //                   onPressed: () {},
// //                   child: const Icon(Icons.av_timer)),
// //               const SizedBox(
// //                 width: 20,
// //               ),
// //               ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     minimumSize:
// //                         Size(context.width(0.02), context.height(0.06)),
// //                     shape: const BeveledRectangleBorder(
// //                         side: BorderSide(
// //                           width: 0.2,
// //                           color: Colors.grey,
// //                         ),
// //                         borderRadius: BorderRadius.all(Radius.circular(5))),
// //                   ),
// //                   onPressed: () {},
// //                   child: const Icon(Icons.av_timer)),
// //               const SizedBox(
// //                 width: 20,
// //               ),
// //               ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     minimumSize:
// //                         Size(context.width(0.02), context.height(0.06)),
// //                     shape: const BeveledRectangleBorder(
// //                         side: BorderSide(
// //                           width: 0.2,
// //                           color: Colors.grey,
// //                         ),
// //                         borderRadius: BorderRadius.all(Radius.circular(5))),
// //                   ),
// //                   onPressed: () {},
// //                   child: const Icon(Icons.av_timer)),
// //             ],
// //           ),
// //           const SizedBox(
// //             height: 40,
// //           ),
// //           TextButton(
// //             onPressed: () {},
// //             child: RichText(
// //               text: const TextSpan(
// //                 children: [
// //                   TextSpan(
// //                     text: 'Already have an account? ',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 15,
// //                     ),
// //                   ),
// //                   TextSpan(
// //                     text: 'Sign In',
// //                     style: TextStyle(
// //                       color: Colors.blue,
// //                       fontSize: 15,
// //                       // decoration: TextDecoration.underline,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:chat_app/core/extension/app_sizes.dart';
// import 'package:chat_app/view/pages/home_screen.dart';
// import 'package:chat_app/view/widgets/signup_screen_widgets/continuewith_button_widget.dart';
// import 'package:chat_app/view/widgets/signup_screen_widgets/signup_texfeild_widget.dart';
// import 'package:chat_app/view/widgets/signup_screen_widgets/textbutton_widget.dart';
// import 'package:flutter/material.dart';

// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({super.key});

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController userNameController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 95, 47, 179),
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 130,
//               ),
//               const Text(
//                 "Create Your Account",
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               SignupTextFormFieldWidget(
//                 controller: userNameController,
//                 labelText: 'Username',
//                 prefixIcon: Icons.person,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Username text';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               SignupTextFormFieldWidget(
//                 controller: emailController,
//                 labelText: 'Email',
//                 prefixIcon: Icons.email,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an email';
//                   }
//                   if (!RegExp(r'^[a-z]').hasMatch(value)) {
//                     return 'Email must start with a lowercase letter';
//                   }
//                   if (!RegExp(
//                           r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
//                       .hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               SignupTextFormFieldWidget(
//                 controller: passwordController,
//                 obscureText: true,
//                 labelText: 'Password',
//                 prefixIcon: Icons.lock,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters long';
//                   }
//                   if (!RegExp(
//                           r'^(?=.*[0-9])(?=.*[!@#$%^&*()_+])[a-zA-Z0-9!@#$%^&*()_+]+$')
//                       .hasMatch(value)) {
//                     return 'Password must contain at least one number and one symbol';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               SizedBox(
//                 height: 60,
//                 width: MediaQuery.sizeOf(context).width / 1.3,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const HomeScreen(),
//                           ));
//                     }
//                   },
//                   child: const Text('SignUp'),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               SizedBox(
//                 width: MediaQuery.sizeOf(context).width,
//                 height: 20,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: context.width(0.25),
//                       child: const Divider(),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       child: Text(
//                         'or continue with',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(
//                       width: context.width(0.25),
//                       child: const Divider(),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ContinuwithbuttonWidget(
//                     color: Colors.blue,
//                     icon: Icons.facebook,
//                     onpress: () {},
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   ContinuwithbuttonWidget(
//                     color: Colors.red,
//                     icon: Icons.g_mobiledata,
//                     onpress: () {},
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   ContinuwithbuttonWidget(
//                     color: Colors.grey,
//                     icon: Icons.apple,
//                     onpress: () {},
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextbuttonWidget(
//                 onpress: () {
//                   Navigator.pop(context);
//                 },
//                 text: 'Already Have an Account?',
//                 text1: 'Sign In',
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:chat_app/view/widgets/signup_screen_widgets/signup_texfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/extension/app_sizes.dart';
import 'package:chat_app/view/pages/home_screen.dart';
import 'package:chat_app/view/widgets/signup_screen_widgets/continuewith_button_widget.dart';
import 'package:chat_app/view/widgets/signup_screen_widgets/textbutton_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 47, 179),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              const Text(
                "Create Your Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SignupTextFormFieldWidget(
                controller: userNameController,
                labelText: 'Username',
                prefixIcon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Username text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              SignupTextFormFieldWidget(
                controller: emailController,
                labelText: 'Email',
                prefixIcon: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(r'^[a-z]').hasMatch(value)) {
                    return 'Email must start with a lowercase letter';
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              SignupTextFormFieldWidget(
                controller: passwordController,
                obscureText: true,
                labelText: 'Password',
                prefixIcon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  if (!RegExp(
                          r'^(?=.*[0-9])(?=.*[!@#$%^&*()_+])[a-zA-Z0-9!@#$%^&*()_+]+$')
                      .hasMatch(value)) {
                    return 'Password must contain at least one number and one symbol';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.3,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text('SignUp'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.width(0.25),
                      child: const Divider(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'or continue with',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: context.width(0.25),
                      child: const Divider(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContinuwithbuttonWidget(
                    color: Colors.blue,
                    icon: Icons.facebook,
                    onpress: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ContinuwithbuttonWidget(
                    color: Colors.red,
                    icon: Icons.g_mobiledata,
                    onpress: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ContinuwithbuttonWidget(
                    color: Colors.grey,
                    icon: Icons.apple,
                    onpress: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextbuttonWidget(
                onpress: () {
                  Navigator.pop(context);
                },
                text: 'Already Have an Account?',
                text1: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
