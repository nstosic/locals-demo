import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:locals_demo/model/login_exception.dart';
import 'package:locals_demo/model/login_request_params.dart';
import 'package:locals_demo/model/login_response_params.dart';
import 'package:locals_demo/usecase/base_usecase.dart';
import 'package:locals_demo/utils/constants.dart';

class LoginRequestUsecase extends BaseUsecase<LoginResponseParams, LoginRequestParams> {
  @override
  FutureOr<LoginResponseParams> execute(LoginRequestParams params) async {
    final response = await http.post(
      Uri.https(Constants.baseUrl, Constants.loginPath),
      body: params.toJson(),
    );
    final json = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception();
    }
    if (json['error'] != null) {
      throw LoginException(message: json['error'] as String);
    }
    return LoginResponseParams.fromJson(json[GlobalJsonResponseKeys.result]);
  }
}
