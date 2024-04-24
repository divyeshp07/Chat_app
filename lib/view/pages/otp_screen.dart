import 'package:chat_app/controller/auth_provider.dart';
import 'package:chat_app/controller/user_login_status/user_provider.dart';
import 'package:chat_app/view/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});
  static const routePath = '/otpscreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController otpController = TextEditingController();
    // final verificationId = ModalRoute.of(context)!.settings.arguments as String;

    return ref.watch(loginStatusProvider).when(
          data: (data) {
            if (data != null) {
              return HomeScreen();
            } else {
              return Scaffold(
                backgroundColor: Colors.amber,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white, // Added background color
                        child: Icon(
                          Icons.lock,
                          size: 50, // Adjusted icon size
                          color: Colors.amber, // Added color
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'OTP Verification', // Corrected spelling
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24), // Adjusted font size
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                        child: Text(
                          'Enter the verification code we just sent to your number +91 *******21.',
                          textAlign: TextAlign.center, // Centered text
                          style: TextStyle(fontSize: 18), // Adjusted font size
                        ),
                      ),
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 60,
                        style: const TextStyle(fontSize: 20),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                        onCompleted: (pin) {},
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ref
                                .watch(authenticationProvider.notifier)
                                .verifyOtp(
                                  context,
                                  otpController.text,
                                );
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                ),
              );
            }
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
