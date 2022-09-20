import 'package:flutter/widgets.dart';
import 'package:locals_demo/ui/screens/home_view.dart';
import 'package:locals_demo/ui/screens/login_view.dart';

enum NavigationTargets {
  home,
  login,
}

typedef OnNavigationCallback = void Function(NavigationTargets, bool);

Widget generateScreenWidget(NavigationTargets page) {
  switch (page) {
    case NavigationTargets.home:
      return const HomeView();
    case NavigationTargets.login:
      return const LoginView();
  }
}
