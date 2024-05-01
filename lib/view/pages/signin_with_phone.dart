import 'package:chat_app/controller/auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignInWithPhoneScreen extends ConsumerWidget {
  SignInWithPhoneScreen({super.key});
  static const routePath = '/signinwithphone';
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.phone,
                size: 50,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Enter Phone Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
              child: RichText(
                text: const TextSpan(
                  text: 'By continuing, I agree to the ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'terms and conditions ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: '&',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'privacy policy',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: IntlPhoneField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                ref.watch(authenticationProvider.notifier).signInWithPhone(
                      context,
                      phoneNumberController.text,
                    );
              },
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
