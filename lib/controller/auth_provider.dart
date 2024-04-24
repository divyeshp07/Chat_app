// import 'package:chat_app/controller/auth_state.dart';
// import 'package:chat_app/core/exceptions/auth_exception/signin_exception.dart';
// import 'package:chat_app/core/exceptions/auth_exception/signup_exception.dart';
// import 'package:chat_app/core/exceptions/base_exception.dart';
// import 'package:chat_app/core/utils/snackbar_utils.dart';
// import 'package:chat_app/service/auth-services/auth_services.dart';
// import 'package:chat_app/view/pages/home_screen.dart';
// import 'package:chat_app/view/pages/otp_screen.dart';
// import 'package:flutter/widgets.dart';
// import 'package:go_router/go_router.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'auth_provider.g.dart';

// @Riverpod(keepAlive: true)
// class Authentication extends _$Authentication {
//   @override
//   AuthState build() {
//     return AuthState(varificationId: '', resendToken: null);
//   }

//   Future<void> signUpwithEmail(BuildContext context, String email,
//       String password, String username) async {
//     try {
//       await AuthServices().signUP(username, email, password);
//       Future.sync(() => context.push(HomeScreen.routePath));
//     } on SignUpException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     } on BaseException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     }
//   }

//   Future<void> signInWithEmail(
//       BuildContext context, String email, String password) async {
//     try {
//       await AuthServices().signIn(email, password);
//       Future.sync(() => context.go(HomeScreen.routePath));
//     } on SigninException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     } on BaseException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     }
//   }

//   Future<void> signinWithGoogle(BuildContext context) async {
//     try {
//       await AuthServices().continueWithGoogle();
//       Future.sync(() => context.go(HomeScreen.routePath));
//     } on BaseException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     }
//   }

//   Future<void> signInWithFacebook(BuildContext context) async {
//     try {
//       await AuthServices().continueWithFacebook();
//       Future.sync(() => context.go(HomeScreen.routePath));
//     } on BaseException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     }
//   }

//   Future<void> signInWithPhone(BuildContext context, String phone) async {
//     try {
//       await AuthServices().signInwithPhone(phone);
//       Future.sync(() => context.push(OtpScreen.routePath));
//     } on BaseException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     }
//   }

//   Future<void> verifyOtp(
//       BuildContext context, String otp, String verificationId) async {
//     try {
//       await AuthServices().verifyOtp(verificationId, otp);
//       Future.sync(() => context.push(HomeScreen.routePath));
//     } on BaseException catch (e) {
//       Future.sync(() => SnackbarUtils.showMessage(context, e.message));
//     }
//   }
// }

import 'dart:developer';

import 'package:chat_app/controller/auth_state.dart';
import 'package:chat_app/controller/user_login_status/user_provider.dart';
import 'package:chat_app/core/exceptions/auth_exception/signin_exception.dart';
import 'package:chat_app/core/exceptions/auth_exception/signup_exception.dart';
import 'package:chat_app/core/exceptions/base_exception.dart';
import 'package:chat_app/core/utils/snackbar_utils.dart';
import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:chat_app/view/pages/home_screen.dart';
import 'package:chat_app/view/pages/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  AuthState build() {
    return AuthState(varificationId: '', resendToken: null);
  }

  Future<void> signUpwithEmail(BuildContext context, String email,
      String password, String username) async {
    try {
      await AuthServices().signUP(username, email, password);
      Future.sync(() => context.push(HomeScreen.routePath));
    } on SignUpException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await AuthServices().signIn(email, password);
      Future.sync(() => context.go(HomeScreen.routePath));
    } on SigninException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      await AuthServices().continueWithGoogle();
      Future.sync(() => context.go(HomeScreen.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      await AuthServices().continueWithFacebook();
      Future.sync(() => context.go(HomeScreen.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final varificationData = await AuthServices().loginWithPhone("+91$phone");
      state = AuthState(
          varificationId: varificationData.$1,
          resendToken: varificationData.$2);
      log(varificationData.$1);
      log(varificationData.$2.toString());
      Future.sync(() => context.push(OtpScreen.routePath));
      Future.sync(() => SnackbarUtils.showMessage(context, 'OTP sended'));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(
    BuildContext context,
    String otp,
  ) async {
    try {
      log('object');
      // TODO:

      await AuthServices().verifyOtp(state.varificationId, otp).then(
        (value) {
          ref.watch(loginStatusProvider).when(
                data: (data) {
                  if (data != null) {
                    return Future.sync(() => context.go(HomeScreen.routePath));
                  }
                },
                error: (error, stackTrace) {},
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
        },
      );

      Future.sync(() => context.push(HomeScreen.routePath));
    } on BaseException catch (e) {
      log('message');
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Stream<User?> loginStatus(BuildContext context) {
    try {
      return AuthServices().loginStatus();
    } on BaseException catch (e) {
      throw Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
