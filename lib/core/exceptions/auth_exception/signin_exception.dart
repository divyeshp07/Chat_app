import 'package:chat_app/core/exceptions/base_exception.dart';

class SigninException extends BaseException {
  final String code;
  SigninException(this.code, super.message);
}
