abstract class Constants {
  static const String baseUrl = 'app-test.rr-qa.seasteaddigital.com';
  static const String loginPath = '/app_api/auth.php';
  static const String feedPath = '/api/v1/posts/feed/global.json';
  static const int pageSize = 20;
}

abstract class GlobalHeaderRequestKeys {
  static const String authToken = 'X-APP-AUTH-TOKEN';
  static const String contentType = 'Content-Type';
  static const String deviceId = 'X-DEVICE-ID';
}

abstract class GlobalJsonResponseKeys {
  static const String code = 'code';
  static const String data = 'data';
  static const String result = 'result';
  static const String status = 'status';
}

abstract class GlobalJsonResponseValues {
  static const String codeOk = 'OK';
  static const int statusOk = 1;
}
