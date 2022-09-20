import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:locals_demo/model/feed_request_params.dart';
import 'package:locals_demo/model/feed_response_params.dart';
import 'package:locals_demo/network_injector.dart';
import 'package:locals_demo/usecase/base_usecase.dart';
import 'package:locals_demo/utils/constants.dart';

class FeedRequestUsecase extends BaseUsecase<FeedResponseParams, FeedRequestParams> {
  @override
  FutureOr<FeedResponseParams> execute(FeedRequestParams params) async {
    final headers = <String, String>{};
    NetworkInjector.instance.injectHeaders(headers);
    final response = await http.post(
      Uri.https(Constants.baseUrl, Constants.feedPath),
      body: jsonEncode(<String, dynamic>{'data': params.toJson()}),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (json[GlobalJsonResponseKeys.code] != GlobalJsonResponseValues.codeOk) {
      throw Exception();
    }
    return FeedResponseParams.fromJson(json);
  }
}
