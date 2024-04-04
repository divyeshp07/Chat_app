import 'package:chat_app/view/pages/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // for automatically next page
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => IntroScreen()));
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 149, 96, 240),
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.004), // adjust the value to change the depth
          child: const Image(
            image: AssetImage(
                'assets/images/765770709f99ec425258dd1ff90f8405-removebg-preview.png'),
            width: 300,
          ),
        ),
      ),
    );
  }
}
