import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:locals_demo/injector_helper.dart';
import 'package:locals_demo/model/login_exception.dart';
import 'package:locals_demo/model/login_request_params.dart';
import 'package:locals_demo/network_injector.dart';
import 'package:locals_demo/ui/base/base_navigation.dart';
import 'package:locals_demo/ui/base/base_viewmodel.dart';
import 'package:locals_demo/usecase/login_request_usecase.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController deviceIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late LoginRequestUsecase loginUsecase;

  @override
  FutureOr<void> init() {
    InjectorHelper.injectLoginViewModelDependency(this);
  }

  Future<void> onLoginPressed() async {
    try {
      final loginRequest = LoginRequestParams(
        deviceId: deviceIdController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      busy = true;
      notifyListeners();
      final loginResponse = await loginUsecase.execute(loginRequest);
      NetworkInjector.instance.storeAuthToken(loginResponse.ssAuthToken);
      NetworkInjector.instance.storeDeviceId(loginRequest.deviceId);
      NetworkInjector.instance.storeUniqueId(loginResponse.uniqueId);
      busy = false;
      navigateTo(NavigationTargets.home, true);
    } on LoginException catch (ex) {
      busy = false;
      errorMessage = ex.message;
      notifyListeners();
    } on Exception catch (ex) {
      busy = false;
      debugPrint(ex.toString());
    }
  }
}
