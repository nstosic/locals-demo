import 'package:locals_demo/ui/screens/home_viewmodel.dart';
import 'package:locals_demo/ui/screens/login_viewmodel.dart';
import 'package:locals_demo/usecase/feed_request_usecase.dart';
import 'package:locals_demo/usecase/login_request_usecase.dart';

abstract class InjectorHelper {
  static void injectLoginViewModelDependency(LoginViewModel instance) {
    instance.loginUsecase = LoginRequestUsecase();
  }

  static void injectHomeViewModelDependency(HomeViewModel instance) {
    instance.feedUsecase = FeedRequestUsecase();
  }
}
