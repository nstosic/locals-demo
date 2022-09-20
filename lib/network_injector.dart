import 'package:locals_demo/utils/constants.dart';

class NetworkInjector {
  NetworkInjector._();

  static NetworkInjector instance = NetworkInjector._();

  late String _authToken;
  String get authToken => _authToken;
  late String _deviceId;
  String get deviceId => _deviceId;
  late String _uniqueId;
  String get uniqueId => _uniqueId;

  void storeAuthToken(String authToken) {
    _authToken = authToken;
  }

  void storeDeviceId(String deviceId) {
    _deviceId = deviceId;
  }

  void storeUniqueId(String uniqueId) {
    _uniqueId = uniqueId;
  }

  void injectHeaders(Map<String, String> headers) {
    headers.addAll(<String, String>{
      GlobalHeaderRequestKeys.authToken: _authToken,
      GlobalHeaderRequestKeys.deviceId: _deviceId,
      GlobalHeaderRequestKeys.contentType: 'application/json',
    });
  }
}
