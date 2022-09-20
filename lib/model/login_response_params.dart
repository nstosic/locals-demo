import 'package:locals_demo/model/base_model.dart';
import 'package:locals_demo/model/json_mixin.dart';

abstract class _LoginResponseJsonKeys {
  static const String activeSubscriber = 'active_subscriber';
  static const String email = 'email';
  static const String ssAuthToken = 'ss_auth_token';
  static const String unclaimedGift = 'unclaimed_gift';
  static const String uniqueId = 'unique_id';
  static const String userId = 'user_id';
  static const String username = 'username';
}

class LoginResponseParams extends BaseModel with JsonSerializable {
  LoginResponseParams({
    required this.activeSubscriber,
    required this.email,
    required this.ssAuthToken,
    required this.unclaimedGift,
    required this.uniqueId,
    required this.userId,
    required this.username,
  });

  factory LoginResponseParams.fromJson(Map<String, dynamic> json) {
    return LoginResponseParams(
      activeSubscriber: json[_LoginResponseJsonKeys.activeSubscriber] as int,
      email: json[_LoginResponseJsonKeys.email] as String,
      ssAuthToken: json[_LoginResponseJsonKeys.ssAuthToken] as String,
      unclaimedGift: json[_LoginResponseJsonKeys.unclaimedGift] as int,
      uniqueId: json[_LoginResponseJsonKeys.uniqueId] as String,
      userId: json[_LoginResponseJsonKeys.userId] as int,
      username: json[_LoginResponseJsonKeys.username] as String,
    );
  }

  final int activeSubscriber;
  final String email;
  final String ssAuthToken;
  final int unclaimedGift;
  final String uniqueId;
  final int userId;
  final String username;

  @override
  int get hashCode =>
      activeSubscriber.hashCode ^
      email.hashCode ^
      ssAuthToken.hashCode ^
      unclaimedGift.hashCode ^
      uniqueId.hashCode ^
      userId.hashCode ^
      username.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (other is LoginResponseParams) {
      return identical(this, other) ||
          (activeSubscriber == other.activeSubscriber &&
              email == other.email &&
              ssAuthToken == other.ssAuthToken &&
              unclaimedGift == other.unclaimedGift &&
              uniqueId == other.uniqueId &&
              userId == other.userId &&
              username == other.username);
    }
    return false;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      _LoginResponseJsonKeys.activeSubscriber: activeSubscriber,
      _LoginResponseJsonKeys.email: email,
      _LoginResponseJsonKeys.ssAuthToken: ssAuthToken,
      _LoginResponseJsonKeys.unclaimedGift: unclaimedGift,
      _LoginResponseJsonKeys.uniqueId: uniqueId,
      _LoginResponseJsonKeys.userId: userId,
      _LoginResponseJsonKeys.username: username,
    };
  }
}
