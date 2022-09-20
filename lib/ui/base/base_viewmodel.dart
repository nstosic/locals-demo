import 'dart:async';

import 'package:flutter/material.dart';
import 'package:locals_demo/ui/base/base_navigation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _busy = false;
  String? _errorMessage;

  bool get busy => _busy;
  @protected
  set busy(bool value) => _busy = value;

  String? get errorMessage => _errorMessage;
  @protected
  set errorMessage(String? value) => _errorMessage = value;

  late OnNavigationCallback navigateTo;

  FutureOr<void> init();
}
