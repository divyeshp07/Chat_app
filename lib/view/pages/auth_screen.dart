import 'package:chat_app/controller/auth_provider/auth_provider.dart';
import 'package:chat_app/view/pages/sign_up_screen.dart';
import 'package:chat_app/view/pages/signin_screen.dart';
import 'package:chat_app/view/pages/signin_with_phone.dart';
import 'package:chat_app/view/widgets/auth_screen_widgets/continuwith_btn_widget.dart';
import 'package:chat_app/view/widgets/signup_screen_widgets/textbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const routePath = '/authscreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 95, 47, 179),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(
                      3, 2, 0.004), // adjust the value to change the depth
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            AuthScreenContinuewithWidget(
                onpress: () {
                  ref
                      .watch(authenticationProvider.notifier)
                      .signInWithFacebook(context);
                },
                icon: Icons.facebook,
                iconcolor: Colors.blue,
                iconsize: 30,
                text: '   Continue With Facebook'),
            const SizedBox(
              height: 20,
            ),
            AuthScreenContinuewithWidget(
                onpress: () {
                  ref
                      .watch(authenticationProvider.notifier)
                      .signinWithGoogle(context);
                },
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
                    context.go(SignInScreen.routePath);
                  },
                  child: const Text('SignIn with Email')),
            ),
            TextButton(
                onPressed: () {
                  context.push(SignInWithPhoneScreen.routePath);
                },
                child: const Text('SignIn with Phone')),
            const SizedBox(
              height: 30,
            ),
            TextbuttonWidget(
              onpress: () {
                context.go(SignUpScreen.routePath);
              },
              text: 'Don\'t have an account? ',
              text1: 'SignUp',
            )
          ],
        ),
      ),
    );
  }
}
