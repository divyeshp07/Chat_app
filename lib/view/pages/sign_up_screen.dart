import 'package:chat_app/controller/auth_provider.dart';
import 'package:chat_app/view/pages/signin_screen.dart';
import 'package:chat_app/view/widgets/texfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/extension/app_sizes.dart';
import 'package:chat_app/view/widgets/signup_screen_widgets/continuewith_button_widget.dart';
import 'package:chat_app/view/widgets/signup_screen_widgets/textbutton_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});
  static const routePath = '/signupscreen';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 47, 179),
      // backgroundColor: Theme.of(context).colorScheme.background,
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
              TextFeildWidget(
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
              TextFeildWidget(
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
              TextFeildWidget(
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
                    print('object');
                    if (formKey.currentState!.validate()) {
                      ref
                          .watch(authenticationProvider.notifier)
                          .signUpwithEmail(context, emailController.text,
                              passwordController.text, userNameController.text);
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
                  context.go(SignInScreen.routePath);
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
