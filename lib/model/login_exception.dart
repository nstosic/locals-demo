import 'package:locals_demo/model/base_exception.dart';

class LoginException extends BaseException {
  const LoginException({required this.message});

  final String message;
}
