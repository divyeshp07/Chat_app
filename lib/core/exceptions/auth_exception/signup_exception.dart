import 'package:chat_app/core/exceptions/base_exception.dart';

class SignUpException extends BaseException {
  final String code;
  SignUpException(this.code, super.message);
}
