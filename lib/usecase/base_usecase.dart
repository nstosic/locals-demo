import 'dart:async';

abstract class BaseUsecase<Response, Request> {
  FutureOr<Response> execute(Request params);
}
