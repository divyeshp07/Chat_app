import 'package:chat_app/view/pages/sign_up_screen.dart';
import 'package:chat_app/view/pages/signin_screen.dart';
import 'package:chat_app/view/widgets/auth_screen_widgets/continuwith_btn_widget.dart';
import 'package:chat_app/view/widgets/signup_screen_widgets/textbutton_widget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 47, 179),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
          const Text(
            "Let's You In",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          AuthScreenContinuewithWidget(
              onpress: () {},
              icon: Icons.facebook,
              iconcolor: Colors.blue,
              iconsize: 30,
              text: '   Continue With Facebook'),
          const SizedBox(
            height: 20,
          ),
          AuthScreenContinuewithWidget(
              onpress: () {},
              icon: Icons.g_mobiledata,
              iconcolor: Colors.red,
              iconsize: 43,
              text: 'Continue with google'),
          const SizedBox(
            height: 20,
          ),
          AuthScreenContinuewithWidget(
            onpress: () {},
            icon: Icons.apple,
            iconcolor: Colors.black,
            iconsize: 36,
            text: '  Continue with apple',
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 130,
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'or',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 130, child: Divider())
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.sizeOf(context).width / 1.3,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ));
                },
                child: const Text('SignIn with Email')),
          ),
          const SizedBox(
            height: 30,
          ),
          TextbuttonWidget(
            onpress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ));
            },
            text: 'Don\'t have an account? ',
            text1: 'SignUp',
          )
        ],
      ),
    );
  }
}
