import 'package:chat_app/core/exceptions/base_exception.dart';

class SignOutException extends BaseException {
  final String code;
  SignOutException(this.code, super.message);
}
