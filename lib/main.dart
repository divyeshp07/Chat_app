import 'dart:async';

import 'package:chat_app/core/routers/router.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // used for orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // Locks the app to portrait mode
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      // home: SettingsScreen(),
      debugShowCheckedModeBanner: false,
      // home: ProfileCardScreen(),
      // home: HomeScreen(),
      // home: SplashScreen(),
      // home: IntroScreen(),
      // home: AuthScreen(),
      // home: SignUpScreen(),
      // home: SignInScreen(),
    );
    // return ref.watch(loginStatusProvider).when(
    //       data: (data) {
    //         if (data == null) {
    //           return SignInScreen();
    //         } else {
    //           return const HomeScreen();
    //         }
    //       },
    //       error: (error, stackTrace) => Center(
    //         child: Text(error.toString()),
    //       ),
    //       loading: () => const Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
  }
}
