import 'package:chat_app/service/auth-services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<User?> loginStatus(LoginStatusRef ref) {
  return AuthServices().loginStatus();
}
