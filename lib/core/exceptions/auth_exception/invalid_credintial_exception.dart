import 'package:chat_app/core/exceptions/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  String? errorMsg;
  InvalidCredentialsException({this.errorMsg})
      : super(errorMsg ?? 'Invalid user input');
}
