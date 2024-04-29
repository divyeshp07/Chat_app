import 'dart:async';
import 'dart:developer';

import 'package:chat_app/core/exceptions/auth_exception/signin_exception.dart';
import 'package:chat_app/core/exceptions/auth_exception/signup_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future<void> signUP(
    String username,
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // !creating collection for home screen users list to chat
      FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set(
        {
          'email': userCredential.user!.email,
          'uid': userCredential.user!.uid,
          'name': 'name',
          'timestamp': DateTime.now(),
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw SignUpException('Password is weak', 'weak password');
      } else if (e.code == 'email-already-in-use') {
        throw SignUpException(
            'The account already exixsts', 'account already exists');
      }
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw SigninException(e.code, 'canot login' 'user not founnd');
      } else if (e.code == 'wrong-password') {
        throw SigninException(e.code, 'cannot login' 'wrong password');
      } else if (e.code == 'user-disable') {
        throw SigninException(e.code, 'cannot login' 'user is disabled');
      }
    }
  }

  Future<void> continueWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on Exception {
      throw SignUpException('Cannot login', 'try again');
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  Future<void> continueWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if the login result is successful
      if (loginResult.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, sign in with the credential
        await _auth.signInWithCredential(facebookAuthCredential);
      } else {
        // Handle unsuccessful login result
        throw SignUpException(
            'Facebook login failed', 'Failed to authenticate with Facebook');
      }
    } catch (e) {
      // Handle any other exceptions
      throw SignUpException('Facebook login error', e.toString());
    }
  }

  Future<void> continueWithApple() async {}

  // Future<UserCredential> continueWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<(String, int?)> loginWithPhone(String phone,
      [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int?>();

      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: resendToken,
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {}
        },
        codeSent: (String? verificationId, int? resendToken) async {
          verificationIdCompleter.complete(verificationId);
          resendTokenCompleter.complete(resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationId) async {},
      );

      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;

      return (verificationId, newResendToken);
    } on Exception {
      throw SigninException('cannot login', 'please check the number');
    }
  }

  Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    log(credential.toString());
    await _auth.signInWithCredential(credential);
  }

  Stream<User?> loginStatus() {
    return _auth.authStateChanges();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
