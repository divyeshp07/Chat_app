import 'package:chat_app/main.dart';
import 'package:chat_app/view/pages/auth_screen.dart';
import 'package:chat_app/view/pages/chat_screen.dart';
import 'package:chat_app/view/pages/home_screen.dart';
import 'package:chat_app/view/pages/intro_screen.dart';
import 'package:chat_app/view/pages/otp_screen.dart';
import 'package:chat_app/view/pages/sign_up_screen.dart';
import 'package:chat_app/view/pages/signin_screen.dart';
import 'package:chat_app/view/pages/signin_with_phone.dart';
import 'package:chat_app/view/pages/spalsh_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  navigatorKey: MainApp.navigatorKey,
  initialLocation: SplashScreen.routePath,
  routes: [
    GoRoute(
      path: AuthScreen.routePath,
      builder: (context, state) {
        return const AuthScreen();
      },
      // redirect: (context, state) {
      //   final user = FirebaseAuth.instance.currentUser;
      //   if (user == null || (!user.emailVerified && user.phoneNumber == null)) {
      //     return SignInScreen.routePath;
      //   }
      //   return null;
      // },
    ),
    GoRoute(
      path: HomeScreen.routePath,
      builder: (context, state) {
        return HomeScreen();
      },
      // redirect: (context, state) {
      //   final user = FirebaseAuth.instance.currentUser;
      //   if (user == null || (!user.emailVerified && user.phoneNumber == null)) {
      //     return SignInScreen.routePath;
      //   }
      //   return null;
      // },
    ),
    GoRoute(
      path: SignUpScreen.routePath,
      builder: (context, state) {
        return SignUpScreen();
      },
    ),
    GoRoute(
      path: SplashScreen.routePath,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: IntroScreen.routePath,
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: SignInScreen.routePath,
      builder: (context, state) {
        return SignInScreen();
      },
    ),
    GoRoute(
      path: SignInWithPhoneScreen.routePath,
      builder: (context, state) {
        return SignInWithPhoneScreen();
      },
    ),
    GoRoute(
      path: ChatScreen.routePath,
      builder: (context, state) {
        return ChatScreen();
      },
    ),
    GoRoute(
      path: OtpScreen.routePath,
      builder: (context, state) {
        return const OtpScreen();
      },
      redirect: (context, state) async {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null && user.phoneNumber == null) {
          // Check if the phone number is verified
          await user.reload(); // Refresh the user data
          if (user.phoneNumber != null) {
            return HomeScreen.routePath;
          }
        }
        return null;
      },
    ),
  ],
);