import 'package:locals_demo/model/base_model.dart';
import 'package:locals_demo/model/json_mixin.dart';

abstract class _LoginRequestJsonKeys {
  static const String deviceId = 'device_id';
  static const String email = 'email';
  static const String password = 'password';
}

class LoginRequestParams extends BaseModel with JsonSerializable {
  LoginRequestParams({
    required this.deviceId,
    required this.email,
    required this.password,
  });

  factory LoginRequestParams.fromJson(Map<String, dynamic> json) {
    return LoginRequestParams(
      deviceId: json[_LoginRequestJsonKeys.deviceId] as String,
      email: json[_LoginRequestJsonKeys.email] as String,
      password: json[_LoginRequestJsonKeys.password] as String,
    );
  }

  final String deviceId;
  final String email;
  final String password;

  @override
  int get hashCode => deviceId.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (other is LoginRequestParams) {
      return identical(this, other) ||
          (deviceId == other.deviceId && email == other.email && password == other.password);
    }
    return false;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      _LoginRequestJsonKeys.deviceId: deviceId,
      _LoginRequestJsonKeys.email: email,
      _LoginRequestJsonKeys.password: password,
    };
  }
}
